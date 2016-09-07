// e+e- --------->        D  anti-D
//                                         
//                                  
//by suyumo
#include "GaudiKernel/MsgStream.h"
#include "GaudiKernel/AlgFactory.h"
#include "GaudiKernel/ISvcLocator.h"
#include "GaudiKernel/SmartDataPtr.h"
#include "GaudiKernel/IDataProviderSvc.h"
#include "GaudiKernel/PropertyMgr.h"
#include "GaudiKernel/INTupleSvc.h"
#include "GaudiKernel/NTuple.h"
#include "GaudiKernel/Bootstrap.h"
#include "GaudiKernel/IHistogramSvc.h"
#include "GaudiKernel/Algorithm.h"
#include "GaudiKernel/DeclareFactoryEntries.h"
#include "GaudiKernel/LoadFactoryEntries.h"

    
#include "EventModel/EventModel.h"
#include "EventModel/Event.h"
    
#include "EvtRecEvent/EvtRecEvent.h"
#include "EvtRecEvent/EvtRecTrack.h"
#include "DstEvent/TofHitStatus.h"
#include "EventModel/EventHeader.h"

#include "McTruth/McParticle.h"
#include "McTruth/DecayMode.h"
#include "McTruth/MdcMcHit.h"
#include "McTruth/TofMcHit.h"
#include "McTruth/EmcMcHit.h"
#include "McTruth/TofMcHit.h"
#include "McTruth/EmcMcHit.h"
#include "McTruth/MucMcHit.h"
#include "McTruth/McEvent.h"
#include "McTruth/McPrimaryParticle.h"


#include "TMath.h"

#include "CLHEP/Vector/ThreeVector.h"
#include "CLHEP/Vector/LorentzVector.h"
#include "CLHEP/Vector/TwoVector.h"
   
#include "CLHEP/Geometry/Point3D.h"
 

#include "VertexFit/KinematicFit.h"
#include "VertexFit/KalmanKinematicFit.h"
#include "VertexFit/VertexFit.h"             
#include "VertexFit/Helix.h"                  
#include "VertexFit/IVertexDbSvc.h"
#include "VertexFit/SecondVertexFit.h"

#include "ParticleID/ParticleID.h"

  
#include <TFile.h>
#include <TH1.h>
#include <TTree.h>

//
// class declaration
//

class DD : public Algorithm {
  
public:
  DD(const std::string&, ISvcLocator*);
  ~DD(); 
  StatusCode initialize();
  StatusCode execute();
  StatusCode finalize();

private:
  // declare r0, z0 cut for charged tracks 
  double m_vr0cut, m_vz0cut;
  // double m_distin_pionlep;
  double m_cha_costheta_cut; 
  double m_total_number_of_charged_max; 
  double m_min_emctime;
  double m_max_emctime;
  double m_gammaCosCut; 
  double m_costheta_barrel_max;
  double m_costheta_endcap_min;
  double m_costheta_endcap_max;
  double m_energy_barrel_min;
  double m_energy_endcap_min;
  double m_photon_iso_angle_min;
  double m_pion_polar_angle_max;
  double m_kaon_polar_angle_max;
  double m_pion_momentum_max;
  double m_kaon_momentum_max;
  double m_prob_pion_min;
  double m_prob_kaon_min;
  double m_kpion_mass_min; 
  double m_kpion_mass_max;
  double m_kpi_costheta_max;
  double m_kpisys_costheta_max; 
  
  // output file
  std::string m_output_filename;
  bool m_isMonteCarlo; 
  TFile* m_fout;

  // define Histograms
  TH1F* h_evtflw; 
  
  // define Trees
  TTree* m_tree;
  TTree* m_tree_4;
  TTree* m_tree_4_T;

  // common info 
  int m_run;
  int m_event;

  // charged tracks
  int m_ncharged;
  int m_mc_ncharged;
  int m_nptrk;
  int m_nmtrk;
  double m_trkp_p; 
  double m_trkp_px; 
  double m_trkp_py; 
  double m_trkp_pz; 
  double m_trkp_theta; 
  double m_trkp_phi; 
  double m_trkp_eraw; 
  
  double m_trkm_p; 
  double m_trkm_px; 
  double m_trkm_py; 
  double m_trkm_pz; 
  double m_trkm_theta; 
  double m_trkm_phi; 
  double m_trkm_eraw; 
  double m_visibleE;
  double m_mc_visibleE;

  // neutral tracks
  int m_nshow;
  int m_ngam;
  int m_mc_ngam;
  double m_visibleEgam; 
  double m_mc_visibleEgam; 
  std::vector<double> *m_raw_gpx; 
  std::vector<double> *m_raw_gpy; 
  std::vector<double> *m_raw_gpz; 
  std::vector<double> *m_raw_ge; 
 
  // vertex 
  double m_vr0;
  double m_vz0;

  // PID info
  double m_prob_pip;
  double m_prob_pim;
  double m_prob_kp;
  double m_prob_km;
  double m_prob_p; 
  double m_prob_pb; 

  // pion info
  double m_pim_px;
  double m_pim_py;
  double m_pim_pz;

  // Kaon info
  double m_kp_px;
  double m_kp_py;
  double m_kp_pz; 

  // fitted info
  double m_vtx_kp_px; 
  double m_vtx_kp_py; 
  double m_vtx_kp_pz; 
  double m_vtx_kp_e;
  double m_vtx_pim_px; 
  double m_vtx_pim_py; 
  double m_vtx_pim_pz; 
  double m_vtx_pim_e;

  double m_vtx_mkpi;
  double m_vtx_mreckpi;
  double m_vtx_coskpi;
  double m_vtx_coskpisys; 

  // check MDC and EMC match
  long m_pion_matched;
  long m_lep_matched;

  // MC information after particls going through detectors
  double m_mc_mom_ee_antiD0_kp;
  double m_mc_mom_ee_antiD0_pim;
  double m_mc_mom_ee_antiD0star_antiD0_kp;
  double m_mc_mom_ee_antiD0star_antiD0_pim;
  double m_mc_mom_ee_D_star_antiD0_kp;
  double m_mc_mom_ee_D_star_antiD0_pim;
  double m_mc_mom_ee_kp;
  double m_mc_mom_ee_pim;
 
  double m_mc1_mom_ee_antiD0D0_kpi;
  double m_mc1_mom_ee_antiD0D0star_kpi;
  double m_mc1_mom_ee_antiD0D0starpi0_kpi;
  double m_mc1_mom_ee_antiD0Dzstarpi_kpi;
  double m_mc1_ivtmass_ee_antiD0D0_kpi;
  double m_mc1_ivtmass_ee_antiD0D0pi0_kpi;
  double m_mc1_ivtmass_ee_antiD0Dzpi_kpi;
  double m_mc1_ivtmass_ee_antiD0D0star_kpi;
 
  double m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi;
  double m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi;
  double m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi;
  double m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi;
  double m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi;
  double m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi;
  double m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi;
  double m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi;

  double m_mc3_mom_ee_D_starDz_antiD0pi_kpi;
  double m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi;
  double m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi;
  double m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi;

  double m_mc4_mom_ee_kpi;
  double m_mc4_ivtmass_ee_kpi;

  // MC infon
  double m_mc1_mom_ee_antiD0D0_kpi_T;
  double m_mc1_mom_ee_antiD0D0star_kpi_T;
  double m_mc1_mom_ee_antiD0D0starpi0_kpi_T;
  double m_mc1_mom_ee_antiD0Dzstarpi_kpi_T;
  double m_mc1_ivtmass_ee_antiD0D0_kpi_T;
  double m_mc1_ivtmass_ee_antiD0D0pi0_kpi_T;
  double m_mc1_ivtmass_ee_antiD0Dzpi_kpi_T;
  double m_mc1_ivtmass_ee_antiD0D0star_kpi_T;
 
  double m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi_T;
  double m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi_T;
  double m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi_T;
  double m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi_T;
  double m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi_T;
  double m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi_T;
  double m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi_T;
  double m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi_T;

  double m_mc3_mom_ee_D_starDz_antiD0pi_kpi_T;
  double m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi_T;
  double m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi_T;
  double m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi_T;

  double m_mc4_mom_ee_kpi_T;
  double m_mc4_ivtmass_ee_kpi_T;

  // functions
  void book_histogram();
  void book_tree(); 
  void book_tree_4();
  void book_tree_4_T();
  bool buildDD();
  void saveGenInfo(); 
  void saveGenInfo_mc(); 
  void saveTrkInfo(EvtRecTrackIterator,
		   EvtRecTrackIterator);
  void saveKaonPionInfo(RecMdcKalTrack *,
		    RecMdcKalTrack *);
  void saveVtxInfo(HepLorentzVector,
		   HepLorentzVector);  
  void saveGamInfo(std::vector<int>,
		   SmartDataPtr<EvtRecTrackCol>);
  int selectChargedTracks(SmartDataPtr<EvtRecEvent>,
			SmartDataPtr<EvtRecTrackCol>,
			std::vector<int> &,
			std::vector<int> &); 
  int selectKaonPionMinus(SmartDataPtr<EvtRecTrackCol>,
		    std::vector<int>,
			std::vector<int>);
  void calcTrackPID(EvtRecTrackIterator,
		    double&,
		    double&,
		    double&);
  bool hasGoodKaPiVertex(RecMdcKalTrack *,
			 RecMdcKalTrack *,
			 bool);
  int selectNeutralTracks(SmartDataPtr<EvtRecEvent>,
			  SmartDataPtr<EvtRecTrackCol>);
  bool passVertexSelection(CLHEP::Hep3Vector,
			   RecMdcKalTrack* );
  CLHEP::Hep3Vector getOrigin();
};

//
// module declare
//

DECLARE_ALGORITHM_FACTORY( DD )
DECLARE_FACTORY_ENTRIES( DD ) {
  DECLARE_ALGORITHM(DD);
}

LOAD_FACTORY_ENTRIES( DD )

//
// constants
//
//
const double ecms=4.260;
const double ebeam=ecms/2.;
const double PION_MASS = 0.13957;
const double KAON_MASS  = 0.493677;

const static double ctheta( 0.022 );
const static HepLorentzVector p4cm(ecms*sin(ctheta/2.),0.0,0.0,ecms);
const static HepLorentzVector p4cm2(-ecms*sin(ctheta/2.),0.0,0.0,ecms);
const static Hep3Vector LAB2CM( p4cm2.boostVector() );

const int PIONPLUS_PDG_ID = 211;
const int KAONPLUS_PDG_ID = 321;
const int PSI4260_PDG_ID = 9030443;
const int D0_PDG_ID = 421;
const int D0STAR_PDG_ID = 423;
const int DPLUS_PDG_ID = 411;
const int DPLUSSTAR_PDG_ID = 413;
const int PION_PDG_ID = 111;
const int GAMMA_PDG_ID = 22;
static int counter[10]={0,0,0,0,0,0,0,0,0,0};
//
// member functions
//

DD::DD(const std::string& name, ISvcLocator* pSvcLocator) :
  Algorithm(name, pSvcLocator),
  m_tree(0),
  m_tree_4(0),
  m_tree_4_T(0),
  m_raw_gpx(0), 
  m_raw_gpy(0), 
  m_raw_gpz(0), 
  m_raw_ge(0)
{
  declareProperty("OutputFileName", m_output_filename);
  declareProperty("IsMonteCarlo", m_isMonteCarlo);
  declareProperty("Vr0cut", m_vr0cut=1.0);
  declareProperty("Vz0cut", m_vz0cut=10.0);
  declareProperty("ChaCosthetaCut", m_cha_costheta_cut=0.93);
  declareProperty("TotalNumberOfChargedMax", m_total_number_of_charged_max=50);
  declareProperty("MinEstCut", m_min_emctime=0.0);
  declareProperty("MaxEstCut", m_max_emctime=14.0);
  declareProperty("GammaCosCut",  m_gammaCosCut= 0.93); 
  declareProperty("CosthetaBarrelMax", m_costheta_barrel_max=0.8);
  declareProperty("CosthetaEndcapMin", m_costheta_endcap_min=0.86);
  declareProperty("CosthetaEndcapMax", m_costheta_endcap_max=0.92);
  declareProperty("EnergyBarrelMin", m_energy_barrel_min=0.025); 
  declareProperty("EnergyEndcapMin", m_energy_endcap_min=0.050); 
  declareProperty("PhotonIsoAngleMin", m_photon_iso_angle_min=10);
  declareProperty("PionPolarAngleMax", m_pion_polar_angle_max=0.99);
  declareProperty("PionPolarAngleMax", m_kaon_polar_angle_max=0.99);
  declareProperty("PionMomentumMax", m_pion_momentum_max=1.9); 
  declareProperty("PionMomentumMax", m_kaon_momentum_max=1.9); 
  declareProperty("ProbPionMin", m_prob_pion_min=0.001);
  declareProperty("ProbKaonMin", m_prob_kaon_min=0.001);
  declareProperty("DDonMassMin", m_kpion_mass_min=1.7); 
  declareProperty("DDonMassMax", m_kpion_mass_max=2.0); 
  declareProperty("KPiCosthetaMax", m_kpi_costheta_max=0.99);
  declareProperty("KPiSysCosthetaMax", m_kpisys_costheta_max=0.99);
}


StatusCode DD::initialize(){
  MsgStream log(msgSvc(), name());
  log << MSG::INFO << ">>>>>>> in initialize()" << endmsg;

  m_fout = new TFile(m_output_filename.c_str(), "RECREATE");
  m_fout->cd();

  book_histogram(); 
  book_tree();
  book_tree_4();
  book_tree_4_T();

  log << MSG::INFO << "successfully return from initialize()" <<endmsg;
  return StatusCode::SUCCESS;
}

StatusCode DD::execute() {
  MsgStream log(msgSvc(), name());
  log << MSG::INFO << "in execute()" << endreq;

  // clear vectors 
  m_raw_gpx->clear();
  m_raw_gpy->clear();
  m_raw_gpz->clear();
  m_raw_ge->clear();

  h_evtflw->Fill(0); // raw 
  SmartDataPtr<Event::EventHeader>eventHeader(eventSvc(),"/Event/EventHeader");
  if(!eventHeader) return StatusCode::FAILURE;

  m_run = eventHeader->runNumber();
  m_event = eventHeader->eventNumber();

  saveGenInfo_mc(); // only fill tree for the selected events
  counter[1]++;

 if(buildDD()){
   saveGenInfo(); // only fill tree for the selected events
   m_tree->Fill();
   counter[2]++;
}

 return StatusCode::SUCCESS; 
}

StatusCode DD::finalize() {
  MsgStream log(msgSvc(), name());
  log << MSG::INFO << "in finalize()" << endmsg;

  m_fout->cd();
  m_tree->Write();
  m_tree_4->Write();
  m_tree_4_T->Write();
  h_evtflw->Write();
  m_fout->Close();

  std::cout << "able:MC Truth==  " << counter[1] << std::endl; 
  std::cout << "final ntupe  ==  " << counter[2] << std::endl;
  return StatusCode::SUCCESS;
}


DD::~DD() {
}


void DD::book_histogram() {

  h_evtflw = new TH1F("hevtflw", "eventflow", 10, 0, 10);
  if (!h_evtflw) return;
  h_evtflw->GetXaxis()->SetBinLabel(1, "raw");
  h_evtflw->GetXaxis()->SetBinLabel(2, "N_{Good}>=2");
  h_evtflw->GetXaxis()->SetBinLabel(3, "N_{#gamma}<20");
  h_evtflw->GetXaxis()->SetBinLabel(4, "|cos#theta|<0.99");
  h_evtflw->GetXaxis()->SetBinLabel(5, "PID"); 
  h_evtflw->GetXaxis()->SetBinLabel(6, "cos#theta_{#k^{+}#pi^{-}}<0.99");
  h_evtflw->GetXaxis()->SetBinLabel(7, "cos#theta_{#k#pi sys}<0.99");

}


void DD::book_tree_4() {

  m_tree_4=new TTree("mc4", "DD_mc4");
  if (!m_tree_4) return; 

  // MC information after particls going through detectors
  if (!m_isMonteCarlo) return; 

  m_tree_4->Branch("mc4_mom_ee_kpi", &m_mc4_mom_ee_kpi, "mc4_mom_ee_kpi/D");
  m_tree_4->Branch("mc4_ivtmass_ee_kpi", &m_mc4_ivtmass_ee_kpi, "mc4_ivtmass_ee_kpi/D");
  m_tree_4->Branch("mc3_mom_ee_D_starDz_antiD0pi_kpi", &m_mc3_mom_ee_D_starDz_antiD0pi_kpi, "mc3_mom_ee_D_starDz_antiD0pi_kpi/D");
  m_tree_4->Branch("mc3_mom_ee_D_starDzstar_antiD0pi_kpi", &m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi, "mc3_mom_ee_D_starDzstar_antiD0pi_kpi/D");
  m_tree_4->Branch("mc3_ivtmass_ee_D_starDz_antiD0pi_kpi", &m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi, "mc3_ivtmass_ee_D_starDz_antiD0pi_kpi/D");
  m_tree_4->Branch("mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi", &m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi, "mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi/D");
  m_tree_4->Branch("mc2_mom_ee_antiD0starD0_antiD0pi0_kpi", &m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi, "mc2_mom_ee_antiD0starD0_antiD0pi0_kpi/D");
  m_tree_4->Branch("mc2_mom_ee_antiD0starD0_antiD0gamma_kpi", &m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi, "mc2_mom_ee_antiD0starD0_antiD0gamma_kpi/D");
  m_tree_4->Branch("mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi", &m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi, "mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi/D");
  m_tree_4->Branch("mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi", &m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi, "mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi/D");
  m_tree_4->Branch("mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi", &m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi, "mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi/D");
  m_tree_4->Branch("mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi", &m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi, "mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi/D");
  m_tree_4->Branch("mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi", &m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi, "mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi/D");
  m_tree_4->Branch("mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi", &m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi, "mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi/D");
  m_tree_4->Branch("mc1_mom_ee_antiD0D0_kpi", &m_mc1_mom_ee_antiD0D0_kpi, "mc1_mom_ee_antiD0D0_kpi/D");
  m_tree_4->Branch("mc1_mom_ee_antiD0D0star_kpi", &m_mc1_mom_ee_antiD0D0star_kpi, "mc1_mom_ee_antiD0D0star_kpi/D");
  m_tree_4->Branch("mc1_mom_ee_antiD0D0starpi0_kpi", &m_mc1_mom_ee_antiD0D0starpi0_kpi, "mc1_mom_ee_antiD0D0starpi0_kpi/D");
  m_tree_4->Branch("mc1_mom_ee_antiD0Dzstarpi_kpi", &m_mc1_mom_ee_antiD0Dzstarpi_kpi, "mc1_mom_ee_antiD0Dzstarpi_kpi/D");
  m_tree_4->Branch("mc1_ivtmass_ee_antiD0D0_kpi", &m_mc1_ivtmass_ee_antiD0D0_kpi, "mc1_ivtmass_ee_antiD0D0_kpi/D");
  m_tree_4->Branch("mc1_ivtmass_ee_antiD0D0star_kpi", &m_mc1_ivtmass_ee_antiD0D0star_kpi, "mc1_ivtmass_ee_antiD0D0star_kpi/D");
  m_tree_4->Branch("mc1_ivtmass_ee_antiD0D0pi0_kpi", &m_mc1_ivtmass_ee_antiD0D0pi0_kpi, "mc1_ivtmass_ee_antiD0D0pi0_kpi/D");
  m_tree_4->Branch("mc1_ivtmass_ee_antiD0Dzpi_kpi", &m_mc1_ivtmass_ee_antiD0Dzpi_kpi, "mc1_ivtmass_ee_antiD0Dzpi_kpi/D");
  m_tree_4->Branch("mc_ncharged", &m_mc_ncharged, "mc_ncharged/I");
  m_tree_4->Branch("mc_ngam", &m_mc_ngam, "mc_ngam/I");
  m_tree_4->Branch("mc_visibleEgam", &m_mc_visibleEgam,"mc_visibleEgam/D");
  m_tree_4->Branch("mc_visibleE", &m_mc_visibleE, "mc_visibleE/D"); 

}


void DD::book_tree() {

  m_tree=new TTree("mc", "DD");
  if (!m_tree) return; 

  //commom info
  m_tree->Branch("run",&m_run,"run/I");
  m_tree->Branch("event",&m_event,"event/I");

  // charged tracks
  m_tree->Branch("ncharged", &m_ncharged, "ncharged/I");
  m_tree->Branch("nptrk", &m_nptrk, "nptrk/I");
  m_tree->Branch("nmtrk", &m_nmtrk, "nmtrk/I");
  m_tree->Branch("trkp_p", &m_trkp_p, "trkp_p/D"); 
  m_tree->Branch("trkp_px", &m_trkp_px, "trkp_px/D"); 
  m_tree->Branch("trkp_py", &m_trkp_py, "trkp_py/D"); 
  m_tree->Branch("trkp_pz", &m_trkp_pz, "trkp_pz/D"); 
  m_tree->Branch("trkp_theta", &m_trkp_theta, "trkp_theta/D"); 
  m_tree->Branch("trkp_phi", &m_trkp_phi, "trkp_phi/D"); 
  m_tree->Branch("trkp_eraw", &m_trkp_eraw, "trkp_eraw/D"); 

  m_tree->Branch("trkm_p", &m_trkm_p, "trkm_p/D"); 
  m_tree->Branch("trkm_px", &m_trkm_px, "trkm_px/D"); 
  m_tree->Branch("trkm_py", &m_trkm_py, "trkm_py/D"); 
  m_tree->Branch("trkm_pz", &m_trkm_pz, "trkm_pz/D"); 
  m_tree->Branch("trkm_theta", &m_trkm_theta, "trkm_theta/D"); 
  m_tree->Branch("trkm_phi", &m_trkm_phi, "trkm_phi/D"); 
  m_tree->Branch("trkm_eraw", &m_trkm_eraw, "trkm_eraw/D"); 
  m_tree->Branch("visibleE", &m_visibleE, "visibleE/D"); 

  //vertex
  m_tree->Branch("vr0", &m_vr0, "vr0/D");
  m_tree->Branch("vz0", &m_vz0, "vz0/D");

	  
  //netual tracks
  m_tree->Branch("nshow", &m_nshow, "nshow/I");
  m_tree->Branch("ngam", &m_ngam, "ngam/I");
  m_tree->Branch("raw_gpx", &m_raw_gpx);
  m_tree->Branch("raw_gpy", &m_raw_gpy);
  m_tree->Branch("raw_gpz", &m_raw_gpz);
  m_tree->Branch("raw_ge", &m_raw_ge);
  m_tree->Branch("visibleEgam", &m_visibleEgam,"visibleEgam/D");

  // PID info
  m_tree->Branch("prob_pip", &m_prob_pip, "prob_pip/D"); 
  m_tree->Branch("prob_pim", &m_prob_pim, "prob_pim/D"); 
  m_tree->Branch("prob_kp", &m_prob_kp, "prob_kp/D"); 
  m_tree->Branch("prob_km", &m_prob_km, "prob_km/D"); 
  m_tree->Branch("prob_p", &m_prob_p, "prob_p/D"); 
  m_tree->Branch("prob_pb", &m_prob_pb, "prob_pb/D"); 

  // save pion info
  m_tree->Branch("pim_px", &m_pim_px, "pim_px/D");
  m_tree->Branch("pim_py", &m_pim_py, "pim_py/D");
  m_tree->Branch("pim_pz", &m_pim_pz, "pim_pz/D");

  // save kaon info
  m_tree->Branch("kp_px", &m_kp_px, "kp_px/D");
  m_tree->Branch("kp_py", &m_kp_py, "kp_py/D");
  m_tree->Branch("kp_pz", &m_kp_pz, "kp_pz/D");

  // fitted info
  m_tree->Branch("vtx_kp_px", &m_vtx_kp_px, "vtx_kp_px/D");
  m_tree->Branch("vtx_kp_py", &m_vtx_kp_py, "vtx_kp_py/D");
  m_tree->Branch("vtx_kp_pz", &m_vtx_kp_pz, "vtx_kp_pz/D");
  m_tree->Branch("vtx_kp_e", &m_vtx_kp_e, "vtx_kp_e/D");
  m_tree->Branch("vtx_pim_px", &m_vtx_pim_px, "vtx_pim_px/D");
  m_tree->Branch("vtx_pim_py", &m_vtx_pim_py, "vtx_pim_py/D");
  m_tree->Branch("vtx_pim_pz", &m_vtx_pim_pz, "vtx_pim_pz/D");
  m_tree->Branch("vtx_pim_e", &m_vtx_pim_e, "vtx_pim_e/D");

  m_tree->Branch("vtx_mkpi", &m_vtx_mkpi, "vtx_mkpi/D");
  m_tree->Branch("vtx_mreckpi", &m_vtx_mreckpi, "vtx_mreckpi/D");
  m_tree->Branch("vtx_coskpi", &m_vtx_coskpi, "vtx_coskpi/D");
  m_tree->Branch("vtx_coskpisys", &m_vtx_coskpisys, "vtx_coskpisys/D");


  // MC information after particls going through detectors
  if (!m_isMonteCarlo) return;
  m_tree->Branch("mc_mom_ee_antiD0_kp", &m_mc_mom_ee_antiD0_kp, "mc_mom_ee_antiD0_kp/D");
  m_tree->Branch("mc_mom_ee_antiD0_pim", &m_mc_mom_ee_antiD0_pim, "mc_mom_ee_antiD0_pim/D");
  m_tree->Branch("mc_mom_ee_antiD0star_antiD0_kp", &m_mc_mom_ee_antiD0star_antiD0_kp, "mc_mom_ee_antiD0star_antiD0_kp/D");
  m_tree->Branch("mc_mom_ee_antiD0star_antiD0_pim", &m_mc_mom_ee_antiD0star_antiD0_pim, "mc_mom_ee_antiD0star_antiD0_pim/D");
  m_tree->Branch("mc_mom_ee_D_star_antiD0_kp", &m_mc_mom_ee_D_star_antiD0_kp, "mc_mom_ee_D_star_antiD0_kp/D");
  m_tree->Branch("mc_mom_ee_D_star_antiD0_pim", &m_mc_mom_ee_D_star_antiD0_pim, "mc_mom_ee_D_star_antiD0_pim/D");

  m_tree->Branch("mc_mom_ee_kp", &m_mc_mom_ee_kp, "mc_mom_ee_kp/D");
  m_tree->Branch("mc_mom_ee_pim", &m_mc_mom_ee_pim, "mc_mom_ee_pim/D");


}


 bool DD::buildDD() {

  
  SmartDataPtr<EvtRecEvent>evtRecEvent(eventSvc(),"/Event/EvtRec/EvtRecEvent");
  if(!evtRecEvent) return false;

  SmartDataPtr<EvtRecTrackCol> evtRecTrkCol(eventSvc(), "/Event/EvtRec/EvtRecTrackCol");
  if(!evtRecTrkCol) return false;

  std::vector<int> iPGood, iMGood; 
  selectChargedTracks(evtRecEvent, evtRecTrkCol, iPGood, iMGood);

  if (m_ncharged < 2) return false;
  h_evtflw->Fill(1); // N_{Good} >= 2 

  selectKaonPionMinus(evtRecTrkCol, iPGood, iMGood);

  selectNeutralTracks(evtRecEvent, evtRecTrkCol);
  if (m_ngam >= 20) return false;
  h_evtflw->Fill(2); // N_{#gamma} < 20 

  return true;   
}



  void DD::saveGenInfo() {
  SmartDataPtr<Event::McParticleCol> mcParticleCol(eventSvc(), "/Event/MC/McParticleCol");

   int nee_antiD0_k_truth=0;
   int nee_antiD0_pi_truth=0;
   int nee_antiD0_anything_truth=0;
   int nee_antiD0star_antiD0_k_truth=0;
   int nee_antiD0star_antiD0_pi_truth=0;
   int nee_antiD0star_antiD0_anything_truth=0;
   int nee_D_star_antiD0_k_truth=0;
   int nee_D_star_antiD0_pi_truth=0;
   int nee_D_star_antiD0_anything_truth=0;
   int nk_truth=0;
   int npi_truth=0;

   int nee_antiD0star_truth=0;
   int nee_antiD0_truth=0;
   int nee_D_star_truth=0;

   int nee_antiD0star_pi0_truth=0;
   int nee_antiD0star_gamma_truth=0;
   int nee_antiD0star_antiD0_truth=0;
   int nee_D_star_pi_truth=0;
   int nee_D_star_antiD0_truth=0;

   int nee_D0_truth=0;
   int nee_D0star_truth=0;
   int nee_Dz_truth=0;
   int nee_Dzstar_truth=0;
   int nee_pi_truth=0;
   int nee_pi0_truth=0;
   int nee_anything_truth=0;
   int nee_antiD0star_anything_truth=0;
   int nee_D_star_anything_truth=0;

   std::vector<HepLorentzVector>  P_ee_antiD0_k, P_ee_antiD0_pi, P_k, P_pi, P_ee_antiD0star_antiD0_k, P_ee_antiD0star_antiD0_pi;
   std::vector<HepLorentzVector>  P_ee_D_star_antiD0_k, P_ee_D_star_antiD0_pi; 

   P_ee_antiD0_k.clear();
   P_ee_antiD0_pi.clear();
   P_ee_antiD0star_antiD0_k.clear();
   P_ee_antiD0star_antiD0_pi.clear();
   P_ee_D_star_antiD0_k.clear();
   P_ee_D_star_antiD0_pi.clear();
   P_k.clear();
   P_pi.clear();

   Event::McParticleCol::iterator iter_mc=mcParticleCol->begin();
   for (; iter_mc != mcParticleCol->end(); iter_mc++){
    if ((*iter_mc)->primaryParticle()) continue;
    if (!(*iter_mc)->decayFromGenerator()) continue;

    HepLorentzVector  mctrue_track = (*iter_mc)->initialFourMomentum();

    if(((*iter_mc)->mother()).particleProperty()==PSI4260_PDG_ID)
       { nee_anything_truth++;  }
    
  if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
    if(((*iter_mc)->mother()).particleProperty()==-D0STAR_PDG_ID)
      {   nee_antiD0star_anything_truth++;}
    if(((*iter_mc)->mother()).particleProperty()==-DPLUSSTAR_PDG_ID)
      {   nee_D_star_anything_truth++;}
   }

  if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
    if(((*iter_mc)->mother()).particleProperty()==-D0STAR_PDG_ID){
              if((*iter_mc)->particleProperty()==-D0_PDG_ID)
              {  nee_antiD0star_antiD0_truth++;    }
              if((*iter_mc)->particleProperty()==GAMMA_PDG_ID)
              {  nee_antiD0star_gamma_truth++;     }
              if((*iter_mc)->particleProperty()==PION_PDG_ID)
              {  nee_antiD0star_pi0_truth++;       }
       }
   }

  if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
    if(((*iter_mc)->mother()).particleProperty()==-DPLUSSTAR_PDG_ID){
              if((*iter_mc)->particleProperty()==-D0_PDG_ID)
              {  nee_D_star_antiD0_truth++;    }
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
              {  nee_D_star_pi_truth++;       }
      }
   }
             
              
       
     

    if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
        if(((*iter_mc)->mother()).particleProperty()==-D0_PDG_ID){
              if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
                   {
                        m_mc_mom_ee_antiD0_kp = mctrue_track.rho();
                        P_ee_antiD0_k.push_back(mctrue_track);
                        nee_antiD0_k_truth++;   
                       }
              
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
                    {
               	       m_mc_mom_ee_antiD0_pim= mctrue_track.rho();
                       P_ee_antiD0_pi.push_back(mctrue_track);
                       nee_antiD0_pi_truth++;
                      }

                       nee_antiD0_anything_truth++;
        }
    }
     
   if(((*iter_mc)->mother().mother().mother()).particleProperty()==PSI4260_PDG_ID){
       if(((*iter_mc)->mother().mother()).particleProperty()==-D0STAR_PDG_ID){
          if(((*iter_mc)->mother()).particleProperty()==-D0_PDG_ID){
              if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
                {
                        m_mc_mom_ee_antiD0star_antiD0_kp = mctrue_track.rho();
                        P_ee_antiD0star_antiD0_k.push_back(mctrue_track);
                        nee_antiD0star_antiD0_k_truth++;  
                }
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
                {
                        m_mc_mom_ee_antiD0star_antiD0_pim = mctrue_track.rho();
                        P_ee_antiD0star_antiD0_pi.push_back(mctrue_track);
                        nee_antiD0star_antiD0_pi_truth++;  
                }

                        nee_antiD0star_antiD0_anything_truth++;  
              }
         }
     }
                   
   if(((*iter_mc)->mother().mother().mother()).particleProperty()==PSI4260_PDG_ID){
       if(((*iter_mc)->mother().mother()).particleProperty()==-DPLUSSTAR_PDG_ID){
          if(((*iter_mc)->mother()).particleProperty()==-D0_PDG_ID){
              if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
                {
                        m_mc_mom_ee_D_star_antiD0_kp = mctrue_track.rho();
                        P_ee_D_star_antiD0_k.push_back(mctrue_track);
                        nee_D_star_antiD0_k_truth++;  
                }
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
                {
                        m_mc_mom_ee_D_star_antiD0_pim = mctrue_track.rho();
                        P_ee_D_star_antiD0_pi.push_back(mctrue_track);
                        nee_D_star_antiD0_pi_truth++;  
                }
 
                        nee_D_star_antiD0_anything_truth++;  

           }
       }
   }
               

    if(((*iter_mc)->mother()).particleProperty()==PSI4260_PDG_ID){
   	   if((*iter_mc)->particleProperty()==D0_PDG_ID)
   	      {  nee_D0_truth++;  }
   	   if((*iter_mc)->particleProperty()==-D0_PDG_ID)
   	   	  {  nee_antiD0_truth++;  }
   	   if((*iter_mc)->particleProperty()==D0STAR_PDG_ID)
   	   	  {  nee_D0star_truth++;  }
   	   if((*iter_mc)->particleProperty()==-D0STAR_PDG_ID)
   	   	  {  nee_antiD0star_truth++;  }
   	   if((*iter_mc)->particleProperty()==DPLUS_PDG_ID)
   	   	  {  nee_Dz_truth++;  }
   	   if((*iter_mc)->particleProperty()==DPLUSSTAR_PDG_ID)
   	   	  {  nee_Dzstar_truth++;  }
   	   if((*iter_mc)->particleProperty()==-DPLUSSTAR_PDG_ID)
   	   	  {  nee_D_star_truth++;  }
   	   if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
   	   	  {  nee_pi_truth++;  }
   	   if((*iter_mc)->particleProperty()==PION_PDG_ID)
   	   	  {  nee_pi0_truth++;  }
           
   }


    if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
      {
        m_mc_mom_ee_kp= mctrue_track.rho();
        P_k.push_back(mctrue_track);
        nk_truth++;
       }
       if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
      {
        m_mc_mom_ee_pim= mctrue_track.rho();
        P_pi.push_back(mctrue_track);
        npi_truth++;
       }


    }


     if(nee_antiD0_k_truth==1&&nee_antiD0_pi_truth==1&&nee_antiD0_anything_truth==2)
      {
             HepLorentzVector P_ee_antiD0_kpi = (P_ee_antiD0_k[0]+P_ee_antiD0_pi[0]);
             P_ee_antiD0_kpi.boost(LAB2CM);

             if(nee_anything_truth==2&&nee_antiD0_truth==1){
                if(nee_D0_truth==1)
               {   m_mc1_mom_ee_antiD0D0_kpi=P_ee_antiD0_kpi.rho();
                   m_mc1_ivtmass_ee_antiD0D0_kpi=P_ee_antiD0_kpi.m(); }
                if(nee_D0star_truth==1)
               {   m_mc1_mom_ee_antiD0D0star_kpi=P_ee_antiD0_kpi.rho(); 
                   m_mc1_ivtmass_ee_antiD0D0star_kpi=P_ee_antiD0_kpi.m();  }
             
               }
             if(nee_anything_truth==3&&nee_antiD0_truth==1){
                if(nee_D0star_truth==1&&nee_pi0_truth==1)
               {   m_mc1_mom_ee_antiD0D0starpi0_kpi=P_ee_antiD0_kpi.rho(); 
                    }
                if(nee_Dzstar_truth==1&&nee_pi_truth==1)
               {   m_mc1_mom_ee_antiD0Dzstarpi_kpi=P_ee_antiD0_kpi.rho(); 
                    }
             
              }

      }


      if(nee_antiD0star_antiD0_k_truth==1&&nee_antiD0star_antiD0_pi_truth==1&&nee_antiD0star_antiD0_anything_truth==2 )
    {
             HepLorentzVector P_ee_antiD0star_antiD0_kpi = (P_ee_antiD0star_antiD0_k[0]+P_ee_antiD0star_antiD0_pi[0]);
             P_ee_antiD0star_antiD0_kpi.boost(LAB2CM);

             if(nee_anything_truth==2&&nee_antiD0star_truth==1&&nee_antiD0star_anything_truth==2&&nee_antiD0star_antiD0_truth==1)
               {
                   if(nee_D0_truth==1&&nee_antiD0star_pi0_truth==1)
                  {  m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi=P_ee_antiD0star_antiD0_kpi.rho();
                     m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi=P_ee_antiD0star_antiD0_kpi.m();  }

                   if(nee_D0_truth==1&&nee_antiD0star_gamma_truth==1)
                  {  m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi=P_ee_antiD0star_antiD0_kpi.rho(); 
                     m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi=P_ee_antiD0star_antiD0_kpi.m(); }
                
                   if(nee_D0star_truth==1&&nee_antiD0star_pi0_truth==1)
                  {  m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi=P_ee_antiD0star_antiD0_kpi.rho(); 
                     m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi=P_ee_antiD0star_antiD0_kpi.m(); }
      
                   if(nee_D0star_truth==1&&nee_antiD0star_gamma_truth==1)
                 {  m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi=P_ee_antiD0star_antiD0_kpi.rho(); 
                    m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi=P_ee_antiD0star_antiD0_kpi.m(); }
           
                 }

        } 


     if( nee_D_star_antiD0_k_truth==1&&nee_D_star_antiD0_pi_truth==1&&nee_D_star_antiD0_anything_truth==2 )
      {
             HepLorentzVector P_ee_D_star_antiD0_kpi = (P_ee_D_star_antiD0_k[0]+P_ee_D_star_antiD0_pi[0]);
             P_ee_D_star_antiD0_kpi.boost(LAB2CM);
           
           if(nee_anything_truth==2&&nee_D_star_truth==1&&nee_D_star_anything_truth==2&&nee_D_star_antiD0_truth==1)
             {
                if(nee_Dz_truth==1&&nee_D_star_pi_truth==1)
                 {   m_mc3_mom_ee_D_starDz_antiD0pi_kpi=P_ee_D_star_antiD0_kpi.rho();
                     m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi=P_ee_D_star_antiD0_kpi.m();}

                if(nee_Dzstar_truth==1&&nee_D_star_pi_truth==1)
                 {   m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi=P_ee_D_star_antiD0_kpi.rho();
                     m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi=P_ee_D_star_antiD0_kpi.m();}

              }

        }


if( nk_truth>0&&npi_truth>0)
   {
       for ( int i7=0;i7<nk_truth;i7++)
        {
         for ( int i8=0;i8<npi_truth;i8++)
          {  
            HepLorentzVector P4_kpi = (P_k[i7]+P_pi[i8]);
            P4_kpi.boost(LAB2CM); 
            
            m_mc4_ivtmass_ee_kpi=P4_kpi.m();
            m_mc4_mom_ee_kpi=P4_kpi.rho();

            m_tree_4->Fill();

            m_mc1_mom_ee_antiD0D0_kpi=99999; 
            m_mc1_mom_ee_antiD0D0star_kpi=99999; 
            m_mc1_mom_ee_antiD0D0starpi0_kpi=99999; 
            m_mc1_mom_ee_antiD0Dzstarpi_kpi=99999; 
            m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi=99999;
            m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi=99999;
            m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi=99999;
            m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi=99999;
            m_mc3_mom_ee_D_starDz_antiD0pi_kpi=99999;
            m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi=99999;
            m_mc1_ivtmass_ee_antiD0D0_kpi=99999; 
            m_mc1_ivtmass_ee_antiD0D0star_kpi=99999; 
            m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi=99999;
            m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi=99999;
            m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi=99999;
            m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi=99999;
            m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi=99999;
            m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi=99999;
            m_mc_ncharged=99999; 
            m_mc_ngam=99999; 
            m_mc_visibleE=99999; 
            m_mc_visibleEgam=99999; 
         }
       }
   }



}
    

CLHEP::Hep3Vector DD::getOrigin() {
  CLHEP::Hep3Vector xorigin(0,0,0);
  IVertexDbSvc*  vtxsvc;
  Gaudi::svcLocator()->service("VertexDbSvc", vtxsvc);
  if(vtxsvc->isVertexValid()){
    double *dbv = vtxsvc->PrimaryVertex(); 
    xorigin.setX(dbv[0]);
    xorigin.setY(dbv[1]);
    xorigin.setZ(dbv[2]);
  }
  return xorigin; 
}



bool DD::passVertexSelection(CLHEP::Hep3Vector xorigin,
				    RecMdcKalTrack* mdcTrk ) {
  HepVector a = mdcTrk->helix();
  HepSymMatrix Ea = mdcTrk->err();
  HepPoint3D point0(0.,0.,0.);
  VFHelix helixip(point0,a,Ea);
  HepPoint3D IP(xorigin[0],xorigin[1],xorigin[2]);
  helixip.pivot(IP);
  HepVector vecipa = helixip.a();
  
  m_vz0 = vecipa[3];
  m_vr0 = vecipa[0];
  
  if(fabs(m_vz0) >= m_vz0cut) return false;
  if(fabs(m_vr0) >= m_vr0cut) return false;
  
  return true;
}


int DD::selectChargedTracks(SmartDataPtr<EvtRecEvent> evtRecEvent,
				   SmartDataPtr<EvtRecTrackCol> evtRecTrkCol,
				   std::vector<int> & iPGood,
				   std::vector<int> & iMGood) {

  CLHEP::Hep3Vector xorigin = getOrigin(); 

  std::vector<int> iGood;
  iGood.clear();
  iPGood.clear();
  iMGood.clear();

  double visibleE = 0;
  
  // loop through charged tracks 
  for(int i = 0; i < evtRecEvent->totalCharged(); i++){
    // get mdcTrk 
    EvtRecTrackIterator itTrk=evtRecTrkCol->begin() + i;

    // Good Kalman Track 
    if(!(*itTrk)->isMdcKalTrackValid()) continue;

    if(!(*itTrk)->isMdcTrackValid()) continue;
    RecMdcKalTrack* mdcTrk = (*itTrk)->mdcKalTrack();

    // Good Vertex 
    if (!passVertexSelection(xorigin, mdcTrk) ) continue; 

    // Polar angle cut
    if(fabs(cos(mdcTrk->theta())) > m_cha_costheta_cut) continue;
    
    // get visible charged particle energy
    HepLorentzVector tracktemp = (0,0,0,0);
    tracktemp.setPx(mdcTrk->px());
    tracktemp.setPy(mdcTrk->py());
    tracktemp.setPz(mdcTrk->pz());
    double p3 = tracktemp.mag();
    tracktemp.setE(sqrt(p3*p3+PION_MASS*PION_MASS));
    tracktemp.boost(LAB2CM);
    visibleE +=tracktemp.e();

    iGood.push_back((*itTrk)->trackId());
    if(mdcTrk->charge()>0) iPGood.push_back((*itTrk)->trackId());
    if(mdcTrk->charge()<0) iMGood.push_back((*itTrk)->trackId());

  } // end charged tracks

  m_ncharged = iGood.size();
  m_mc_ncharged = iGood.size();
  m_nptrk = iPGood.size();
  m_nmtrk = iMGood.size(); 
  m_visibleE = visibleE;
  m_mc_visibleE = visibleE;

  if (m_nptrk > 0 && m_nmtrk > 0) {
    EvtRecTrackIterator itTrk_p = evtRecTrkCol->begin() + iPGood[0];
    EvtRecTrackIterator itTrk_m = evtRecTrkCol->begin() + iMGood[0];
    saveTrkInfo(itTrk_p, itTrk_m);
  }
  return iGood.size(); 
}


int DD::selectKaonPionMinus(SmartDataPtr<EvtRecTrackCol> evtRecTrkCol,
				       std::vector<int> iPGood,
				       std::vector<int> iMGood) {
  int nkpi = 0;
  bool evtflw_filled = false;
  
  for(unsigned int i1 = 0; i1 < iPGood.size(); i1++) {
    EvtRecTrackIterator itTrk_p = evtRecTrkCol->begin() + iPGood[i1];
    RecMdcTrack* mdcTrk_p = (*itTrk_p)->mdcTrack();
    if (mdcTrk_p->charge() < 0) continue; // only positive charged tracks

    for(unsigned int i2 = 0; i2 < iMGood.size(); i2++) {
      EvtRecTrackIterator itTrk_m = evtRecTrkCol->begin() + iMGood[i2];
      RecMdcTrack* mdcTrk_m = (*itTrk_m)->mdcTrack();
      if (mdcTrk_m->charge() > 0) continue; // only negative charged tracks

      // polar angle for both kaon and pion
      if ( ! ( fabs(cos(mdcTrk_p->theta())) < m_kaon_polar_angle_max &&
      	       fabs(cos(mdcTrk_m->theta())) < m_pion_polar_angle_max )) continue;
      if ( !evtflw_filled ) h_evtflw->Fill(3); // |cos#theta| cut 

      // track PID
      double prob_pip, prob_kp, prob_pim, prob_km, prob_p, prob_pb; 
      calcTrackPID(itTrk_p, prob_pip, prob_kp, prob_p);  
      calcTrackPID(itTrk_m, prob_pim, prob_km, prob_pb);
      // printf(">>> %f, %f, %f, %f \n", prob_pip, prob_kp, prob_pim, prob_km);

      m_prob_pip = prob_pip;
      m_prob_kp = prob_kp;
      m_prob_p = prob_p;
      m_prob_pim = prob_pim;
      m_prob_km = prob_km;
      m_prob_pb = prob_pb;
      
      if(! (prob_kp > prob_pip &&
       	    prob_kp > m_prob_kaon_min &&
            prob_kp > prob_p &&
       	    prob_pim > prob_km &&
            prob_pim > prob_pb &&
       	    prob_pim > m_prob_pion_min) ) continue;

      if ( !evtflw_filled ) h_evtflw->Fill(4); //PID
 
      // apply vertex fit
      RecMdcKalTrack *kapTrk = (*(evtRecTrkCol->begin()+iPGood[i1]))->mdcKalTrack();
      RecMdcKalTrack *pimTrk = (*(evtRecTrkCol->begin()+iMGood[i2]))->mdcKalTrack();

      saveKaonPionInfo(kapTrk, pimTrk);
      
      if (! hasGoodKaPiVertex(kapTrk, pimTrk, evtflw_filled) ) continue; 
      
      nkpi++;
      evtflw_filled = true;
    }
  } 

  return nkpi; 
}


void DD::calcTrackPID(EvtRecTrackIterator itTrk_p,
			     double& prob_pip,
			     double& prob_kp,
			     double& prob_p) {
  prob_pip = 999.; 
  prob_kp = 999.; 
  prob_p = 999.; 
  ParticleID * pidp = ParticleID::instance();
  pidp->init();
  pidp->setMethod(pidp->methodProbability());
  pidp->setChiMinCut(4);
  pidp->setRecTrack(*itTrk_p);
  // use PID sub-system
  pidp->usePidSys(pidp->useDedx() | pidp->useTof1() | pidp->useTof2());
  pidp->identify(pidp->onlyPionKaonProton());
  pidp->calculate();
  if(pidp->IsPidInfoValid()) {
    prob_pip = pidp->probPion();
    prob_kp  = pidp->probKaon();
    prob_p   = pidp->probProton();
  }
}


bool DD::hasGoodKaPiVertex(RecMdcKalTrack *kapTrk,
				  RecMdcKalTrack *pimTrk,
				  bool evtflw_filled) {

 // HepLorentzVector pcms(0.011*m_ecms, 0., 0., m_ecms);

  HepLorentzVector p4_vtx_kap, p4_vtx_pim, p4_vtx_kapi, p4_vtx_reckapi;
  WTrackParameter wvkapTrk, wvpimTrk;
  kapTrk->setPidType(RecMdcKalTrack::kaon);
  wvkapTrk = WTrackParameter(KAON_MASS, kapTrk->getZHelix(), kapTrk->getZError());

  pimTrk->setPidType(RecMdcKalTrack::pion);
  wvpimTrk = WTrackParameter(PION_MASS, pimTrk->getZHelix(), pimTrk->getZError());
  
  HepPoint3D vx(0., 0., 0.);
  HepSymMatrix Evx(3, 0);

  double bx = 1E+6;
  double by = 1E+6;
  double bz = 1E+6;
  Evx[0][0] = bx*bx;
  Evx[1][1] = by*by;
  Evx[2][2] = bz*bz;
  
  VertexParameter vxpar;
  vxpar.setVx(vx);
  vxpar.setEvx(Evx);
  
  VertexFit* vtxfit = VertexFit::instance();
  vtxfit->init();
  vtxfit->AddTrack(0,  wvkapTrk);
  vtxfit->AddTrack(1,  wvpimTrk);
  vtxfit->AddVertex(0, vxpar,0,1);

  if(!vtxfit->Fit(0)) return false;

  vtxfit->Swim(0);
      
  WTrackParameter wkap = vtxfit->wtrk(0);
  WTrackParameter wpim = vtxfit->wtrk(1);
  p4_vtx_kap = vtxfit->pfit(0) ;
  p4_vtx_pim = vtxfit->pfit(1) ;
  p4_vtx_reckapi = p4cm - p4_vtx_kap - p4_vtx_pim; 
  p4_vtx_kapi = p4_vtx_kap + p4_vtx_pim;

  double coskapi = cos(p4_vtx_kap.vect().angle(p4_vtx_pim.vect()));
  double coskapisys = (p4_vtx_kap + p4_vtx_pim).cosTheta();

  if( ! (coskapi < m_kpi_costheta_max) ) return false;
  if( !evtflw_filled ) h_evtflw->Fill(5); // "cos#theta_{#k^{+}#pi^{-}}<0.99"

  if( ! (fabs(coskapisys) < m_kpisys_costheta_max ) ) return false;
  if( !evtflw_filled ) h_evtflw->Fill(6); // cos#theta_{#k#pi sys}<0.99 

  saveVtxInfo(p4_vtx_kap, p4_vtx_pim); 
  m_vtx_mreckpi = p4_vtx_reckapi.m();
  m_vtx_mkpi = p4_vtx_kapi.m();
  m_vtx_coskpi = coskapi;
  m_vtx_coskpisys = coskapisys; 
  
  return true;
}

 
 int DD::selectNeutralTracks(SmartDataPtr<EvtRecEvent> evtRecEvent,
				   SmartDataPtr<EvtRecTrackCol> evtRecTrkCol) {

  std::vector<int> iGam;
  iGam.clear();
  std::vector<int> iShow;
  iShow.clear();

  // loop through neutral tracks
  for(int i=evtRecEvent->totalCharged(); i< evtRecEvent->totalTracks(); i++) {
    if (i > m_total_number_of_charged_max) break;

    EvtRecTrackIterator itTrk = evtRecTrkCol->begin() + i ;
    if(!(*itTrk)->isEmcShowerValid()) continue;
    RecEmcShower *emcTrk = (*itTrk)->emcShower();
    iShow.push_back((*itTrk)->trackId());
    
    // TDC window
    if ( !(emcTrk->time() >= m_min_emctime && emcTrk->time() <= m_max_emctime) )
      continue; 

    // Energy threshold
    double abs_costheta(fabs(cos(emcTrk->theta())));
    bool barrel = (abs_costheta < m_costheta_barrel_max); 
    bool endcap = (abs_costheta > m_costheta_endcap_min
		   && abs_costheta < m_costheta_barrel_max);
    double eraw = emcTrk->energy();
    
    if ( !( (barrel && eraw > m_energy_barrel_min)
	    || (endcap && eraw > m_energy_endcap_min)))  continue; 

    // photon isolation: the opening angle between a candidate shower
    // and the closest charged track should be larger than 10 degree 
    CLHEP::Hep3Vector emcpos(emcTrk->x(), emcTrk->y(), emcTrk->z());

    // EMC costheta cut 
    double costhe = cos(emcpos.theta());
    if ( fabs(costhe) >= m_gammaCosCut) continue;
    
    // find the nearest charged track
    double dthe = 200.;
    double dphi = 200.;
    double dang = 200.; 
    for(int j = 0; j < evtRecEvent->totalCharged(); j++) {
      EvtRecTrackIterator jtTrk = evtRecTrkCol->begin() + j;
      if(!(*jtTrk)->isExtTrackValid()) continue;
      RecExtTrack *extTrk = (*jtTrk)->extTrack();
      if(extTrk->emcVolumeNumber() == -1) continue;
      CLHEP::Hep3Vector extpos = extTrk->emcPosition();
      double angd = extpos.angle(emcpos);
      double thed = extpos.theta() - emcpos.theta();
      double phid = extpos.deltaPhi(emcpos);
      thed = fmod(thed+CLHEP::twopi+CLHEP::twopi+pi, CLHEP::twopi) - CLHEP::pi;
      phid = fmod(phid+CLHEP::twopi+CLHEP::twopi+pi, CLHEP::twopi) - CLHEP::pi;

      if(fabs(thed) < fabs(dthe)) dthe = thed;
      if(fabs(phid) < fabs(dphi)) dphi = phid;
      if(angd < dang) dang = angd;	    
    }

    if(dang>=200) continue;
    dthe = dthe * 180 / (CLHEP::pi);
    dphi = dphi * 180 / (CLHEP::pi);
    dang = dang * 180 / (CLHEP::pi);
    if (dang < m_photon_iso_angle_min ) continue; 

    iGam.push_back((*itTrk)->trackId());
  } // end loop neutral tracks     

  m_ngam = iGam.size();
  m_mc_ngam = iGam.size();
  m_nshow = iShow.size();

  saveGamInfo(iGam, evtRecTrkCol);   
  
  return iGam.size(); 
}


  void DD::saveTrkInfo(EvtRecTrackIterator itTrk_p,
			    EvtRecTrackIterator itTrk_m) {

  RecMdcTrack* mdcTrk_p = (*itTrk_p)->mdcTrack(); 
  m_trkp_p = mdcTrk_p->p();
  m_trkp_px = mdcTrk_p->px();
  m_trkp_py = mdcTrk_p->py();
  m_trkp_pz = mdcTrk_p->pz();
  m_trkp_theta = mdcTrk_p->theta();
  m_trkp_phi = mdcTrk_p->phi();
  
  if((*itTrk_p)->isEmcShowerValid()){
    RecEmcShower *emcTrk_p = (*itTrk_p)->emcShower();
    m_trkp_eraw = emcTrk_p->energy();
  }

  RecMdcTrack* mdcTrk_m = (*itTrk_m)->mdcTrack();
  m_trkm_p = mdcTrk_m->p();
  m_trkm_px = mdcTrk_m->px();
  m_trkm_py = mdcTrk_m->py();
  m_trkm_pz = mdcTrk_m->pz();
  m_trkm_theta = mdcTrk_m->theta();
  m_trkm_phi = mdcTrk_m->phi();
  
  if((*itTrk_m)->isEmcShowerValid()){
    RecEmcShower *emcTrk_m = (*itTrk_m)->emcShower();
    m_trkm_eraw = emcTrk_m->energy();
  }

}

  void DD::saveGamInfo(std::vector<int> iGam,
			    SmartDataPtr<EvtRecTrackCol> evtRecTrkCol){

  double visibleEgam = 0;
  for(vector<int>::size_type i=0; i<iGam.size(); i++)  {
    
    EvtRecTrackIterator itTrk = evtRecTrkCol->begin() + iGam[i];
    RecEmcShower* emcTrk = (*itTrk)->emcShower();
    double eraw = emcTrk->energy();
    double phi = emcTrk->phi();
    double theta = emcTrk->theta(); 
    HepLorentzVector p4 = HepLorentzVector(eraw * sin(theta) * cos(phi),
					   eraw * sin(theta) * sin(phi),
					   eraw * cos(theta),
					   eraw );
    p4.boost(LAB2CM);
    m_raw_gpx->push_back(p4.px());
    m_raw_gpy->push_back(p4.py());
    m_raw_gpz->push_back(p4.pz());
    m_raw_ge->push_back(p4.e());
    visibleEgam +=p4.e();
    
   }
    m_visibleEgam = visibleEgam;
    m_mc_visibleEgam = visibleEgam;
}


  void DD::saveKaonPionInfo(RecMdcKalTrack *kapTrk,
			     RecMdcKalTrack *pimTrk){

  m_kp_px = kapTrk->px();
  m_kp_py = kapTrk->py();
  m_kp_pz = kapTrk->pz();

  m_pim_px = pimTrk->px();
  m_pim_py = pimTrk->py();
  m_pim_pz = pimTrk->pz();
  
}

  void DD::saveVtxInfo(HepLorentzVector p4_vtx_kap,
			    HepLorentzVector p4_vtx_pim){

  m_vtx_kp_px = p4_vtx_kap.px();
  m_vtx_kp_py = p4_vtx_kap.py();
  m_vtx_kp_pz = p4_vtx_kap.pz();
  m_vtx_kp_e = p4_vtx_kap.e();

  m_vtx_pim_px = p4_vtx_pim.px();
  m_vtx_pim_py = p4_vtx_pim.py();
  m_vtx_pim_pz = p4_vtx_pim.pz();
  m_vtx_pim_e = p4_vtx_pim.e();

}


   void DD::saveGenInfo_mc() {
  SmartDataPtr<Event::McParticleCol> mcParticleCol(eventSvc(), "/Event/MC/McParticleCol");

   int nee_antiD0_k_truth=0;
   int nee_antiD0_pi_truth=0;
   int nee_antiD0_anything_truth=0;
   int nee_antiD0star_antiD0_k_truth=0;
   int nee_antiD0star_antiD0_pi_truth=0;
   int nee_antiD0star_antiD0_anything_truth=0;
   int nee_D_star_antiD0_k_truth=0;
   int nee_D_star_antiD0_pi_truth=0;
   int nee_D_star_antiD0_anything_truth=0;
   int nk_truth=0;
   int npi_truth=0;

   int nee_antiD0star_truth=0;
   int nee_antiD0_truth=0;
   int nee_D_star_truth=0;

   int nee_antiD0star_pi0_truth=0;
   int nee_antiD0star_gamma_truth=0;
   int nee_antiD0star_antiD0_truth=0;
   int nee_D_star_pi_truth=0;
   int nee_D_star_antiD0_truth=0;

   int nee_D0_truth=0;
   int nee_D0star_truth=0;
   int nee_Dz_truth=0;
   int nee_Dzstar_truth=0;
   int nee_pi_truth=0;
   int nee_pi0_truth=0;
   int nee_anything_truth=0;
   int nee_antiD0star_anything_truth=0;
   int nee_D_star_anything_truth=0;

   std::vector<HepLorentzVector>  P_ee_antiD0_k, P_ee_antiD0_pi, P_k, P_pi, P_ee_antiD0star_antiD0_k, P_ee_antiD0star_antiD0_pi;
   std::vector<HepLorentzVector>  P_ee_D_star_antiD0_k, P_ee_D_star_antiD0_pi; 

   P_ee_antiD0_k.clear();
   P_ee_antiD0_pi.clear();
   P_ee_antiD0star_antiD0_k.clear();
   P_ee_antiD0star_antiD0_pi.clear();
   P_ee_D_star_antiD0_k.clear();
   P_ee_D_star_antiD0_pi.clear();
   P_k.clear();
   P_pi.clear();

   Event::McParticleCol::iterator iter_mc=mcParticleCol->begin();
   for (; iter_mc != mcParticleCol->end(); iter_mc++){
    if ((*iter_mc)->primaryParticle()) continue;
    if (!(*iter_mc)->decayFromGenerator()) continue;

    HepLorentzVector  mctrue_track = (*iter_mc)->initialFourMomentum();

    if(((*iter_mc)->mother()).particleProperty()==PSI4260_PDG_ID)
       { nee_anything_truth++;  }
    
  if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
    if(((*iter_mc)->mother()).particleProperty()==-D0STAR_PDG_ID)
      {   nee_antiD0star_anything_truth++;}
    if(((*iter_mc)->mother()).particleProperty()==-DPLUSSTAR_PDG_ID)
      {   nee_D_star_anything_truth++;}
   }

  if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
    if(((*iter_mc)->mother()).particleProperty()==-D0STAR_PDG_ID){
              if((*iter_mc)->particleProperty()==-D0_PDG_ID)
              {  nee_antiD0star_antiD0_truth++;    }
              if((*iter_mc)->particleProperty()==GAMMA_PDG_ID)
              {  nee_antiD0star_gamma_truth++;     }
              if((*iter_mc)->particleProperty()==PION_PDG_ID)
              {  nee_antiD0star_pi0_truth++;       }
       }
   }

  if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
    if(((*iter_mc)->mother()).particleProperty()==-DPLUSSTAR_PDG_ID){
              if((*iter_mc)->particleProperty()==-D0_PDG_ID)
              {  nee_D_star_antiD0_truth++;    }
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
              {  nee_D_star_pi_truth++;       }
      }
   }
             
              
       
     

    if(((*iter_mc)->mother().mother()).particleProperty()==PSI4260_PDG_ID){
        if(((*iter_mc)->mother()).particleProperty()==-D0_PDG_ID){
              if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
                   {
                        P_ee_antiD0_k.push_back(mctrue_track);
                        nee_antiD0_k_truth++;   
                       }
              
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
                    {
                       P_ee_antiD0_pi.push_back(mctrue_track);
                       nee_antiD0_pi_truth++;
                      }

                       nee_antiD0_anything_truth++;
        }
    }
     
   if(((*iter_mc)->mother().mother().mother()).particleProperty()==PSI4260_PDG_ID){
       if(((*iter_mc)->mother().mother()).particleProperty()==-D0STAR_PDG_ID){
          if(((*iter_mc)->mother()).particleProperty()==-D0_PDG_ID){
              if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
                {
                        P_ee_antiD0star_antiD0_k.push_back(mctrue_track);
                        nee_antiD0star_antiD0_k_truth++;  
                }
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
                {
                        P_ee_antiD0star_antiD0_pi.push_back(mctrue_track);
                        nee_antiD0star_antiD0_pi_truth++;  
                }

                        nee_antiD0star_antiD0_anything_truth++;  
              }
         }
     }
                   
   if(((*iter_mc)->mother().mother().mother()).particleProperty()==PSI4260_PDG_ID){
       if(((*iter_mc)->mother().mother()).particleProperty()==-DPLUSSTAR_PDG_ID){
          if(((*iter_mc)->mother()).particleProperty()==-D0_PDG_ID){
              if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
                {
                        P_ee_D_star_antiD0_k.push_back(mctrue_track);
                        nee_D_star_antiD0_k_truth++;  
                }
              if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
                {
                        P_ee_D_star_antiD0_pi.push_back(mctrue_track);
                        nee_D_star_antiD0_pi_truth++;  
                }
 
                        nee_D_star_antiD0_anything_truth++;  

           }
       }
   }
               

    if(((*iter_mc)->mother()).particleProperty()==PSI4260_PDG_ID){
   	   if((*iter_mc)->particleProperty()==D0_PDG_ID)
   	      {  nee_D0_truth++;  }
   	   if((*iter_mc)->particleProperty()==-D0_PDG_ID)
   	   	  {  nee_antiD0_truth++;  }
   	   if((*iter_mc)->particleProperty()==D0STAR_PDG_ID)
   	   	  {  nee_D0star_truth++;  }
   	   if((*iter_mc)->particleProperty()==-D0STAR_PDG_ID)
   	   	  {  nee_antiD0star_truth++;  }
   	   if((*iter_mc)->particleProperty()==DPLUS_PDG_ID)
   	   	  {  nee_Dz_truth++;  }
   	   if((*iter_mc)->particleProperty()==DPLUSSTAR_PDG_ID)
   	   	  {  nee_Dzstar_truth++;  }
   	   if((*iter_mc)->particleProperty()==-DPLUSSTAR_PDG_ID)
   	   	  {  nee_D_star_truth++;  }
   	   if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
   	   	  {  nee_pi_truth++;  }
   	   if((*iter_mc)->particleProperty()==PION_PDG_ID)
   	   	  {  nee_pi0_truth++;  }
           
   }


    if((*iter_mc)->particleProperty()==KAONPLUS_PDG_ID)
      {
        P_k.push_back(mctrue_track);
        nk_truth++;
       }
       if((*iter_mc)->particleProperty()==-PIONPLUS_PDG_ID)
      {
        P_pi.push_back(mctrue_track);
        npi_truth++;
       }


    }


     if(nee_antiD0_k_truth==1&&nee_antiD0_pi_truth==1&&nee_antiD0_anything_truth==2)
      {
             HepLorentzVector P_ee_antiD0_kpi = (P_ee_antiD0_k[0]+P_ee_antiD0_pi[0]);
             P_ee_antiD0_kpi.boost(LAB2CM);

             if(nee_anything_truth==2&&nee_antiD0_truth==1){
                if(nee_D0_truth==1)
               {   m_mc1_mom_ee_antiD0D0_kpi_T=P_ee_antiD0_kpi.rho();
                   m_mc1_ivtmass_ee_antiD0D0_kpi_T=P_ee_antiD0_kpi.m(); }
                if(nee_D0star_truth==1)
               {   m_mc1_mom_ee_antiD0D0star_kpi_T=P_ee_antiD0_kpi.rho(); 
                   m_mc1_ivtmass_ee_antiD0D0star_kpi_T=P_ee_antiD0_kpi.m();  }
             
               }
             if(nee_anything_truth==3&&nee_antiD0_truth==1){
                if(nee_D0star_truth==1&&nee_pi0_truth==1)
               {   m_mc1_mom_ee_antiD0D0starpi0_kpi_T=P_ee_antiD0_kpi.rho(); 
                   m_mc1_ivtmass_ee_antiD0D0pi0_kpi_T=P_ee_antiD0_kpi.m();}
                if(nee_Dzstar_truth==1&&nee_pi_truth==1)
               {   m_mc1_mom_ee_antiD0Dzstarpi_kpi_T=P_ee_antiD0_kpi.rho(); 
                   m_mc1_ivtmass_ee_antiD0Dzpi_kpi_T=P_ee_antiD0_kpi.m();}
             
              }

      }


      if(nee_antiD0star_antiD0_k_truth==1&&nee_antiD0star_antiD0_pi_truth==1&&nee_antiD0star_antiD0_anything_truth==2 )
    {
             HepLorentzVector P_ee_antiD0star_antiD0_kpi = (P_ee_antiD0star_antiD0_k[0]+P_ee_antiD0star_antiD0_pi[0]);
             P_ee_antiD0star_antiD0_kpi.boost(LAB2CM);

             if(nee_anything_truth==2&&nee_antiD0star_truth==1&&nee_antiD0star_anything_truth==2&&nee_antiD0star_antiD0_truth==1)
               {
                   if(nee_D0_truth==1&&nee_antiD0star_pi0_truth==1)
                  {  m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi_T=P_ee_antiD0star_antiD0_kpi.rho();
                     m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi_T=P_ee_antiD0star_antiD0_kpi.m();  }

                   if(nee_D0_truth==1&&nee_antiD0star_gamma_truth==1)
                  {  m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi_T=P_ee_antiD0star_antiD0_kpi.rho(); 
                     m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi_T=P_ee_antiD0star_antiD0_kpi.m(); }
                
                   if(nee_D0star_truth==1&&nee_antiD0star_pi0_truth==1)
                  {  m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi_T=P_ee_antiD0star_antiD0_kpi.rho(); 
                     m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi_T=P_ee_antiD0star_antiD0_kpi.m(); }
      
                   if(nee_D0star_truth==1&&nee_antiD0star_gamma_truth==1)
                 {  m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi_T=P_ee_antiD0star_antiD0_kpi.rho(); 
                    m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi_T=P_ee_antiD0star_antiD0_kpi.m(); }
           
                 }

        } 


     if( nee_D_star_antiD0_k_truth==1&&nee_D_star_antiD0_pi_truth==1&&nee_D_star_antiD0_anything_truth==2 )
      {
             HepLorentzVector P_ee_D_star_antiD0_kpi = (P_ee_D_star_antiD0_k[0]+P_ee_D_star_antiD0_pi[0]);
             P_ee_D_star_antiD0_kpi.boost(LAB2CM);
           
           if(nee_anything_truth==2&&nee_D_star_truth==1&&nee_D_star_anything_truth==2&&nee_D_star_antiD0_truth==1)
             {
                if(nee_Dz_truth==1&&nee_D_star_pi_truth==1)
                 {   m_mc3_mom_ee_D_starDz_antiD0pi_kpi_T=P_ee_D_star_antiD0_kpi.rho();
                     m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi_T=P_ee_D_star_antiD0_kpi.m();}

                if(nee_Dzstar_truth==1&&nee_D_star_pi_truth==1)
                 {   m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi_T=P_ee_D_star_antiD0_kpi.rho();
                     m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi_T=P_ee_D_star_antiD0_kpi.m();}

              }

        }


if( nk_truth>0&&npi_truth>0)
   {
       for ( int i7=0;i7<nk_truth;i7++)
        {
         for ( int i8=0;i8<npi_truth;i8++)
          {  
            HepLorentzVector P4_kpi = (P_k[i7]+P_pi[i8]);
            P4_kpi.boost(LAB2CM); 
            
            m_mc4_ivtmass_ee_kpi_T=P4_kpi.m();
            m_mc4_mom_ee_kpi_T=P4_kpi.rho();

            m_tree_4_T->Fill();

            m_mc1_mom_ee_antiD0D0_kpi_T=99999; 
            m_mc1_mom_ee_antiD0D0star_kpi_T=99999; 
            m_mc1_mom_ee_antiD0D0starpi0_kpi_T=99999; 
            m_mc1_mom_ee_antiD0Dzstarpi_kpi_T=99999; 
            m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi_T=99999;
            m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi_T=99999;
            m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi_T=99999;
            m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi_T=99999;
            m_mc3_mom_ee_D_starDz_antiD0pi_kpi_T=99999;
            m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi_T=99999;
            m_mc1_ivtmass_ee_antiD0D0_kpi_T=99999; 
            m_mc1_ivtmass_ee_antiD0D0pi0_kpi_T=99999; 
            m_mc1_ivtmass_ee_antiD0Dzpi_kpi_T=99999; 
            m_mc1_ivtmass_ee_antiD0D0star_kpi_T=99999; 
            m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi_T=99999;
            m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi_T=99999;
            m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi_T=99999;
            m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi_T=99999;
            m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi_T=99999;
            m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi_T=99999;
         }
       }
   }

}


   void DD::book_tree_4_T() {

  m_tree_4_T=new TTree("mc4_T", "DD_mc4_T");
  if (!m_tree_4_T) return; 

  // MC information 
  if (!m_isMonteCarlo) return; 

  m_tree_4_T->Branch("mc4_mom_ee_kpi_T", &m_mc4_mom_ee_kpi_T, "mc4_mom_ee_kpi_T/D");
  m_tree_4_T->Branch("mc4_ivtmass_ee_kpi_T", &m_mc4_ivtmass_ee_kpi_T, "mc4_ivtmass_ee_kpi_T/D");
  m_tree_4_T->Branch("mc3_mom_ee_D_starDz_antiD0pi_kpi_T", &m_mc3_mom_ee_D_starDz_antiD0pi_kpi_T, "mc3_mom_ee_D_starDz_antiD0pi_kpi_T/D");
  m_tree_4_T->Branch("mc3_mom_ee_D_starDzstar_antiD0pi_kpi_T", &m_mc3_mom_ee_D_starDzstar_antiD0pi_kpi_T, "mc3_mom_ee_D_starDzstar_antiD0pi_kpi_T/D");
  m_tree_4_T->Branch("mc3_ivtmass_ee_D_starDz_antiD0pi_kpi_T", &m_mc3_ivtmass_ee_D_starDz_antiD0pi_kpi_T, "mc3_ivtmass_ee_D_starDz_antiD0pi_kpi_T/D");
  m_tree_4_T->Branch("mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi_T", &m_mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi_T, "mc3_ivtmass_ee_D_starDzstar_antiD0pi_kpi_T/D");
  m_tree_4_T->Branch("mc2_mom_ee_antiD0starD0_antiD0pi0_kpi_T", &m_mc2_mom_ee_antiD0starD0_antiD0pi0_kpi_T, "mc2_mom_ee_antiD0starD0_antiD0pi0_kpi_T/D");
  m_tree_4_T->Branch("mc2_mom_ee_antiD0starD0_antiD0gamma_kpi_T", &m_mc2_mom_ee_antiD0starD0_antiD0gamma_kpi_T, "mc2_mom_ee_antiD0starD0_antiD0gamma_kpi_T/D");
  m_tree_4_T->Branch("mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi_T", &m_mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi_T, "mc2_mom_ee_antiD0starD0star_antiD0pi0_kpi_T/D");
  m_tree_4_T->Branch("mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi_T", &m_mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi_T, "mc2_mom_ee_antiD0starD0star_antiD0gamma_kpi_T/D");
  m_tree_4_T->Branch("mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi_T", &m_mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi_T, "mc2_ivtmass_ee_antiD0starD0_antiD0pi0_kpi_T/D");
  m_tree_4_T->Branch("mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi_T", &m_mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi_T, "mc2_ivtmass_ee_antiD0starD0_antiD0gamma_kpi_T/D");
  m_tree_4_T->Branch("mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi_T", &m_mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi_T, "mc2_ivtmass_ee_antiD0starD0star_antiD0pi0_kpi_T/D");
  m_tree_4_T->Branch("mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi_T", &m_mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi_T, "mc2_ivtmass_ee_antiD0starD0star_antiD0gamma_kpi_T/D");
  m_tree_4_T->Branch("mc1_mom_ee_antiD0D0_kpi_T", &m_mc1_mom_ee_antiD0D0_kpi_T, "mc1_mom_ee_antiD0D0_kpi_T/D");
  m_tree_4_T->Branch("mc1_mom_ee_antiD0D0star_kpi_T", &m_mc1_mom_ee_antiD0D0star_kpi_T, "mc1_mom_ee_antiD0D0star_kpi_T/D");
  m_tree_4_T->Branch("mc1_mom_ee_antiD0D0starpi0_kpi_T", &m_mc1_mom_ee_antiD0D0starpi0_kpi_T, "mc1_mom_ee_antiD0D0starpi0_kpi_T/D");
  m_tree_4_T->Branch("mc1_mom_ee_antiD0Dzstarpi_kpi_T", &m_mc1_mom_ee_antiD0Dzstarpi_kpi_T, "mc1_mom_ee_antiD0Dzstarpi_kpi_T/D");
  m_tree_4_T->Branch("mc1_ivtmass_ee_antiD0D0_kpi_T", &m_mc1_ivtmass_ee_antiD0D0_kpi_T, "mc1_ivtmass_ee_antiD0D0_kpi_T/D");
  m_tree_4_T->Branch("mc1_ivtmass_ee_antiD0D0star_kpi_T", &m_mc1_ivtmass_ee_antiD0D0star_kpi_T, "mc1_ivtmass_ee_antiD0D0star_kpi_T/D");
  m_tree_4_T->Branch("mc1_ivtmass_ee_antiD0D0pi0_kpi_T", &m_mc1_ivtmass_ee_antiD0D0pi0_kpi_T, "mc1_ivtmass_ee_antiD0D0pi0_kpi_T/D");
  m_tree_4_T->Branch("mc1_ivtmass_ee_antiD0Dzpi_kpi_T", &m_mc1_ivtmass_ee_antiD0Dzpi_kpi_T, "mc1_ivtmass_ee_antiD0Dzpi_kpi_T/D");

}