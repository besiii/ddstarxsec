----------> uses
# use GaudiInterface GaudiInterface-* External
#   use GaudiKernel *  (no_version_directory)
#     use GaudiPolicy v*  (no_version_directory)
#       use LCG_Settings *  (no_version_directory)
#         use LCG_SettingsCompat *  (no_version_directory)
#         use LCG_SettingsCompat *  (no_version_directory)
#       use Python * LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.5.4p2)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use tcmalloc v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.4)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#     use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#       use GCCXML v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=0.9.0_20090601)
#         use LCG_Configuration v*  (no_version_directory)
#         use LCG_Settings v*  (no_version_directory)
#       use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#     use Reflex v* LCG_Interfaces (no_version_directory)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#       use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=5.24.00b)
#     use Boost v* LCG_Interfaces (no_version_directory) (native_version=1.39.0_python2.5)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#       use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.5.4p2)
#     use CppUnit v* LCG_Interfaces (private) (no_auto_imports) (no_version_directory) (native_version=1.12.1_p1)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#   use GaudiSvc *  (no_version_directory)
#     use GaudiKernel v*  (no_version_directory)
#     use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#     use CLHEP v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.0.4.5)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
#     use Boost v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.39.0_python2.5)
#     use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=5.24.00b)
#     use PCRE v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=4.4)
#       use LCG_Configuration v*  (no_version_directory)
#       use LCG_Settings v*  (no_version_directory)
# use BesCLHEP * External
#   use CLHEP v* LCG_Interfaces (no_version_directory) (native_version=2.0.4.5)
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#     use LCG_Configuration v*  (no_version_directory)
#     use LCG_Settings v*  (no_version_directory)
#   use HepPDT * LCG_Interfaces (no_version_directory) (native_version=2.05.04)
#     use LCG_Configuration v*  (no_version_directory)
#     use LCG_Settings v*  (no_version_directory)
#   use BesExternalArea BesExternalArea-* External
# use PartPropSvc *  (no_version_directory)
#   use GaudiPolicy v*  (no_version_directory)
#   use GaudiKernel v*  (no_version_directory)
#   use HepPDT v* LCG_Interfaces (no_version_directory)
#   use GaudiSvc v*  (private) (no_auto_imports) (no_version_directory)
# use CASTOR * LCG_Interfaces (no_version_directory) (native_version=2.1.8-10)
#   use LCG_Configuration v*  (no_version_directory)
#   use LCG_Settings v*  (no_version_directory)
# use ExHelloWorld * BesExamples
#   use BesPolicy BesPolicy-01-* 
#     use BesCxxPolicy BesCxxPolicy-* 
#       use GaudiPolicy v*  (no_version_directory)
#     use BesFortranPolicy BesFortranPolicy-* 
#       use LCG_Settings v*  (no_version_directory)
#   use GaudiInterface GaudiInterface-01-* External
# use RhopiAlg RhopiAlg-00-* Analysis/Physics
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use DstEvent DstEvent-* Event
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use BesCLHEP BesCLHEP-* External
#     use EventModel EventModel-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use BesCLHEP BesCLHEP-* External
#     use EventModel EventModel-* Event
#     use EvTimeEvent EvTimeEvent-* Event
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use BesCLHEP BesCLHEP-* External
#       use MdcGeomSvc MdcGeomSvc-* Mdc
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use calibUtil * Calibration
#           use GaudiInterface GaudiInterface-01-* External
#           use facilities * Calibration
#             use BesPolicy BesPolicy-* 
#           use xmlBase * Calibration
#             use BesPolicy * 
#             use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#               use LCG_Configuration v*  (no_version_directory)
#               use LCG_Settings v*  (no_version_directory)
#             use facilities * Calibration
#           use rdbModel * Calibration
#             use BesPolicy * 
#             use facilities * Calibration
#             use xmlBase * Calibration
#             use MYSQL * External
#               use mysql * LCG_Interfaces (no_version_directory) (native_version=5.0.18)
#                 use LCG_Configuration v*  (no_version_directory)
#                 use LCG_Settings v*  (no_version_directory)
#           use BesROOT BesROOT-00-* External
#             use CASTOR v* LCG_Interfaces (no_version_directory)
#             use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#           use DatabaseSvc DatabaseSvc-* Database
#             use BesPolicy BesPolicy-* 
#             use GaudiInterface GaudiInterface-* External
#             use mysql * LCG_Interfaces (no_version_directory) (native_version=5.0.18)
#             use sqlite * LCG_Interfaces (no_version_directory) (native_version=3.6.8)
#               use LCG_Configuration v*  (no_version_directory)
#               use LCG_Settings v*  (no_version_directory)
#             use BesROOT * External
#         use CalibData * Calibration
#           use facilities facilities-* Calibration
#           use GaudiInterface * External
#           use BesROOT BesROOT-00-* External
#         use EventModel EventModel-* Event
#         use BesCLHEP BesCLHEP-00-* External (private)
#       use RelTable RelTable-* Event
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#       use EventModel EventModel-* Event
#       use Identifier Identifier-* DetectorDescription
#         use BesPolicy BesPolicy-* 
#     use MdcRecEvent MdcRecEvent-* Mdc
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use MdcGeomSvc MdcGeomSvc-* Mdc
#       use RelTable RelTable-* Event
#       use EventModel EventModel-* Event
#       use Identifier Identifier-* DetectorDescription
#       use DstEvent DstEvent-* Event
#       use BesCLHEP BesCLHEP-* External (private)
#     use TofRecEvent TofRecEvent-* Tof
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use Identifier Identifier-* DetectorDescription
#       use EventModel EventModel-* Event
#       use DstEvent * Event
#     use EmcRecEventModel EmcRecEventModel-* Emc
#       use BesPolicy BesPolicy-* 
#       use Identifier Identifier-* DetectorDescription
#       use BesCLHEP BesCLHEP-* External
#       use EventModel EventModel-* Event
#       use DstEvent DstEvent-* Event
#       use EmcRecGeoSvc EmcRecGeoSvc-* Emc
#         use BesPolicy BesPolicy-* 
#         use Identifier Identifier-* DetectorDescription
#         use ROOTGeo ROOTGeo-* DetectorDescription
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use BesCLHEP BesCLHEP-* External
#           use BesROOT BesROOT-* External
#           use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use GdmlToRoot GdmlToRoot-* External
#             use BesExternalArea BesExternalArea-* External
#             use BesROOT BesROOT-* External
#           use GdmlManagement GdmlManagement-* DetectorDescription
#             use BesExternalArea BesExternalArea-* External
#         use BesCLHEP BesCLHEP-* External
#         use GaudiInterface GaudiInterface-* External
#     use MucRecEvent MucRecEvent-* Muc
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use Identifier Identifier-* DetectorDescription
#       use EventModel EventModel-* Event
#       use ExtEvent ExtEvent-* Event
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use BesCLHEP BesCLHEP-* External
#         use EventModel EventModel-* Event
#         use DstEvent DstEvent-* Event
#       use MucGeomSvc MucGeomSvc-* Muc
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use Identifier Identifier-* DetectorDescription
#         use ROOTGeo ROOTGeo-* DetectorDescription
#         use BesCLHEP BesCLHEP-* External
#         use BesROOT BesROOT-* External
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use GdmlToRoot GdmlToRoot-* External
#         use G4Geo G4Geo-* DetectorDescription
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use BesCLHEP BesCLHEP-* External
#           use BesGeant4 BesGeant4-* External
#             use BesExternalArea BesExternalArea-00-* External
#             use BesCLHEP BesCLHEP-00-* External
#           use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use GdmlToG4 GdmlToG4-* External
#             use BesExternalArea BesExternalArea-* External
#             use BesGeant4 BesGeant4-* External
#             use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use GdmlManagement GdmlManagement-* DetectorDescription
#           use Identifier Identifier-* DetectorDescription
#           use SimUtil SimUtil-* Simulation/BOOST
#             use BesPolicy BesPolicy-01-* 
#             use BesGeant4 BesGeant4-00-* External
#       use DstEvent DstEvent-* Event
#       use BesCLHEP BesCLHEP-* External (private)
#     use ExtEvent ExtEvent-* Event
#     use DstEvent DstEvent-* Event
#   use VertexFit VertexFit-* Analysis
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-* External
#     use BesCLHEP BesCLHEP-* External
#     use MYSQL MYSQL-* External
#     use DstEvent DstEvent-* Event
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use MagneticField MagneticField-* 
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-* External
#       use BesCLHEP * External
#       use BesROOT * External
#       use EventModel EventModel-* Event
#       use rdbModel * Calibration
#       use DatabaseSvc * Database
#       use BesTimerSvc BesTimerSvc-* Utilities
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-* External
#     use EventModel EventModel-* Event
#     use EvtRecEvent EvtRecEvent-* Event
#     use DatabaseSvc DatabaseSvc-* Database
#   use ParticleID ParticleID-* Analysis
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use DstEvent DstEvent-* Event
#     use BesROOT BesROOT-* External
#     use EvtRecEvent EvtRecEvent-* Event
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use TofRecEvent TofRecEvent-* Tof
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use MucRecEvent MucRecEvent-* Muc
#     use ExtEvent ExtEvent-* Event
#   use BesROOT BesROOT-00-* External
# use PipiJpsiAlg PipiJpsiAlg-* Analysis/Physics/PsiPrime
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use TrigEvent TrigEvent-* Event
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-01-* External
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use McTruth McTruth-* Event
#     use BesPolicy BesPolicy-01-* 
#     use EventModel EventModel-* Event
#     use GaudiInterface GaudiInterface-01-* External
#     use Identifier Identifier-* DetectorDescription
#     use RelTable RelTable-* Event
#     use BesCLHEP BesCLHEP-* External (private)
#   use MdcRecEvent MdcRecEvent-* Mdc
# use AbsCor AbsCor-* Analysis/PhotonCor
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use RawEvent RawEvent-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use Identifier Identifier-* DetectorDescription
#       use EventModel EventModel-* Event
#     use EventModel EventModel-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use Identifier Identifier-* DetectorDescription
#   use EmcRecEventModel EmcRecEventModel-* Emc
# use CalibSvc CalibSvc-* Calibration
#   use CalibMySQLCnv * Calibration/CalibSvc
#     use BesPolicy * 
#     use calibUtil * Calibration
#     use CalibData * Calibration
#     use GaudiInterface * External
#     use MYSQL MYSQL-00-* External
#     use CalibDataSvc * Calibration/CalibSvc
#       use BesPolicy * 
#       use BesROOT * External
#       use calibUtil * Calibration
#       use CalibData * Calibration
#       use DstEvent DstEvent-* Event
#       use EventModel EventModel-* Event
#       use GaudiInterface * External
#   use CalibROOTCnv * Calibration/CalibSvc
#     use BesPolicy * 
#     use calibUtil * Calibration
#     use CalibData * Calibration
#     use GaudiInterface * External
#     use BesROOT BesROOT-00-* External
#     use EventModel EventModel-* Event
#     use CalibDataSvc * Calibration/CalibSvc
#     use CalibMySQLCnv * Calibration/CalibSvc
#   use CalibDataSvc * Calibration/CalibSvc
#   use CalibXmlCnvSvc * Calibration/CalibSvc
#     use BesPolicy * 
#     use calibUtil * Calibration
#     use GaudiInterface * External
#     use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#     use CalibDataSvc * Calibration/CalibSvc
#   use CalibTreeCnv * Calibration/CalibSvc
#     use BesPolicy * 
#     use calibUtil * Calibration
#     use CalibData * Calibration
#     use MYSQL MYSQL-00-* External
#     use GaudiInterface * External
#     use BesROOT BesROOT-00-* External
#     use DstEvent DstEvent-* Event
#     use EventModel EventModel-* Event
#     use CalibDataSvc * Calibration/CalibSvc
#     use CalibMySQLCnv * Calibration/CalibSvc
#     use DatabaseSvc DatabaseSvc-* Database
# use tofcalgsec tofcalgsec-* Tof
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-* External
#   use BesROOT BesROOT-00-* External
#   use BesCLHEP BesCLHEP-* External
#   use EventModel EventModel-* Event
#   use TofRecEvent TofRecEvent-* Tof
#   use TofRec TofRec-* Reconstruction
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use Identifier Identifier-* DetectorDescription
#     use TofRawEvent TofRawEvent-* Tof
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use RawEvent RawEvent-* Event
#       use EventModel EventModel-* Event
#     use TofRecEvent TofRecEvent-* Tof
#     use TofGeomSvc TofGeomSvc-* Tof
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-* External
#       use BesCLHEP BesCLHEP-* External (private)
#     use TofCaliSvc TofCaliSvc-* Tof
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-* External
#       use calibUtil * Calibration
#       use CalibData * Calibration
#       use CalibSvc * Calibration
#       use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#       use MYSQL MYSQL-00-00-* External
#       use BesROOT BesROOT-* External
#       use BesCLHEP BesCLHEP-* External (private)
#     use EvTimeEvent EvTimeEvent-* Event
#     use AsciiDmp AsciiDmp-* Event
#       use BesPolicy BesPolicy-* 
#     use EventModel EventModel-* Event
#     use RawEvent RawEvent-* Event
#     use ExtEvent ExtEvent-* Event
#     use McTruth McTruth-* Event
#     use ReconEvent ReconEvent-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use BesCLHEP BesCLHEP-* External
#       use EventModel EventModel-* Event
#       use ExtEvent ExtEvent-* Event
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#       use BesPolicy BesPolicy-01-* 
#       use RootPolicy RootPolicy-* 
#         use BesPolicy BesPolicy-* 
#         use BesROOT BesROOT-00-* External
#       use GaudiInterface GaudiInterface-01-* External
#       use BesCLHEP BesCLHEP-* External
#       use MdcRawEvent MdcRawEvent-* Mdc
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use TofRawEvent TofRawEvent-* Tof
#       use TofCaliSvc TofCaliSvc-* Tof
#       use TofQCorrSvc TofQCorrSvc-* Tof
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use CalibData * Calibration
#         use EventModel EventModel-* Event
#         use DatabaseSvc DatabaseSvc-* Database
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use MYSQL MYSQL-00-00-* External
#         use BesROOT BesROOT-* External
#         use BesCLHEP BesCLHEP-* External (private)
#       use TofQElecSvc TofQElecSvc-* Tof
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use calibUtil * Calibration
#         use CalibData * Calibration
#         use CalibSvc * Calibration
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use MYSQL MYSQL-00-00-* External
#         use BesROOT BesROOT-* External
#         use BesCLHEP BesCLHEP-* External (private)
#       use EmcRawEvent EmcRawEvent-* Emc
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use RawEvent RawEvent-* Event
#         use EventModel EventModel-* Event
#         use Identifier Identifier-* DetectorDescription
#         use EmcWaveform EmcWaveform-* Emc
#           use BesPolicy BesPolicy-* 
#           use GaudiInterface GaudiInterface-* External
#       use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-* External
#         use CalibData CalibData-* Calibration
#         use CalibDataSvc CalibDataSvc-* Calibration/CalibSvc
#         use CalibROOTCnv CalibROOTCnv-* Calibration/CalibSvc
#         use EmcRecGeoSvc EmcRecGeoSvc-* Emc
#         use EmcGeneralClass EmcGeneralClass-* Emc
#           use BesPolicy BesPolicy-* 
#           use Identifier Identifier-* DetectorDescription
#         use BesCLHEP BesCLHEP-* External
#       use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use CalibData CalibData-* Calibration
#         use CalibSvc CalibSvc-* Calibration
#         use MdcGeomSvc MdcGeomSvc-* Mdc
#         use BesCLHEP BesCLHEP-* External
#       use EvTimeEvent EvTimeEvent-* Event
#     use TrigEvent TrigEvent-* Event
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use RootHistCnv v*  (no_version_directory)
#       use GaudiKernel v*  (no_version_directory)
#       use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#       use ROOT v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=5.24.00b)
#       use PCRE v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=4.4)
#     use BesCLHEP BesCLHEP-* External (private)
#   use ExtEvent ExtEvent-* Event
#   use BesGeant4 BesGeant4-00-* External
# use OfflineEventLoopMgr * Control
#   use BesPolicy BesPolicy-* 
#   use BesBoost BesBoost-* External
#     use Boost v* LCG_Interfaces (no_version_directory) (native_version=1.39.0_python2.5)
#   use GaudiInterface GaudiInterface-01-* External
#   use GaudiSvc v*  (no_version_directory)
#   use EventModel EventModel-* Event
# use Reconstruction Reconstruction-* 
#   use MdcDedxAlg MdcDedxAlg-* Reconstruction
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-* External
#     use EventModel EventModel-* Event
#     use EvtRecEvent EvtRecEvent-* Event
#     use BesCLHEP BesCLHEP-* External
#     use ReconEvent ReconEvent-* Event
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use DedxCorrecSvc DedxCorrecSvc-* Mdc
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use BesCLHEP BesCLHEP-* External
#       use MdcGeomSvc MdcGeomSvc-* Mdc
#       use calibUtil * Calibration
#       use CalibData * Calibration
#       use MagneticField MagneticField-* 
#       use Identifier * DetectorDescription
#       use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#       use MYSQL MYSQL-00-00-* External
#     use EsTimeAlg EsTimeAlg-* Reconstruction
#       use BesPolicy BesPolicy-01-* 
#       use EmcRec EmcRec-* Reconstruction
#         use BesPolicy BesPolicy-* 
#         use Identifier Identifier-* DetectorDescription
#         use GaudiInterface GaudiInterface-01-* External
#         use BesROOT BesROOT-00-* External
#         use EmcRecEventModel EmcRecEventModel-01-* Emc
#         use EmcRecGeoSvc EmcRecGeoSvc-01-* Emc
#         use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#         use RawDataProviderSvc RawDataProviderSvc-* Event
#         use MdcRawEvent MdcRawEvent-* Mdc
#         use TofRawEvent TofRawEvent-* Tof
#         use EmcRawEvent EmcRawEvent-* Emc
#         use EventModel EventModel-* Event
#         use ReconEvent ReconEvent-* Event
#         use McTruth McTruth-* Event
#         use RootHistCnv v*  (no_version_directory)
#       use MdcRawEvent MdcRawEvent-* Mdc
#       use TofRawEvent TofRawEvent-* Tof
#       use EmcRawEvent EmcRawEvent-* Emc
#       use EmcRecEventModel EmcRecEventModel-* Emc
#       use CERNLIB CERNLIB-* External
#         use cernlib v* LCG_Interfaces (no_version_directory) (native_version=2006a)
#           use LCG_Configuration v*  (no_version_directory)
#           use LCG_Settings v*  (no_version_directory)
#           use blas v* LCG_Interfaces (no_version_directory) (native_version=20070405)
#             use LCG_Configuration v*  (no_version_directory)
#             use LCG_Settings v*  (no_version_directory)
#           use lapack v* LCG_Interfaces (no_version_directory) (native_version=3.1.1)
#             use LCG_Configuration v*  (no_version_directory)
#             use LCG_Settings v*  (no_version_directory)
#             use blas v* LCG_Interfaces (no_version_directory) (native_version=20070405)
#         use CASTOR v* LCG_Interfaces (no_version_directory) (native_version=2.1.8-10)
#       use BesCLHEP BesCLHEP-* External
#       use MdcTables MdcTables-* Mdc
#         use MdcRecEvent MdcRecEvent-* Mdc
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use MdcGeomSvc MdcGeomSvc-* Mdc
#         use Identifier Identifier-* DetectorDescription
#         use BesCLHEP BesCLHEP-* External (private)
#       use MdcGeomSvc MdcGeomSvc-* Mdc
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use EstTofCaliSvc EstTofCaliSvc-* Tof
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use calibUtil * Calibration
#         use CalibData * Calibration
#         use CalibSvc * Calibration
#         use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#         use MYSQL MYSQL-00-00-* External
#         use BesROOT BesROOT-* External
#         use BesCLHEP BesCLHEP-* External (private)
#       use TofQElecSvc TofQElecSvc-* Tof
#       use TofSim TofSim-* Simulation/BOOST
#         use BesPolicy BesPolicy-01-* 
#         use BesGeant4 BesGeant4-00-* External
#         use GdmlToG4 GdmlToG4-* External
#         use SimUtil SimUtil-* Simulation/BOOST
#         use TruSim TruSim-* Simulation/BOOST
#           use BesPolicy BesPolicy-01-* 
#           use BesGeant4 BesGeant4-* External
#           use BesCLHEP BesCLHEP-* External
#           use GeneratorObject GeneratorObject-* Generator
#             use BesPolicy BesPolicy-* 
#             use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#             use EventModel EventModel-* Event
#             use BesCLHEP * External (private)
#         use GaudiInterface GaudiInterface-* External
#         use G4Svc G4Svc-* Simulation
#           use BesCLHEP BesCLHEP-* External
#           use BesPolicy BesPolicy-* 
#           use GaudiInterface GaudiInterface-01-* External
#           use GeneratorObject GeneratorObject-* Generator
#           use BesGeant4 BesGeant4-00-* External
#           use RealizationSvc RealizationSvc-* Simulation/Realization
#             use BesPolicy BesPolicy-01-* 
#             use GaudiInterface GaudiInterface-01-* External
#             use BesCLHEP * External
#             use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#             use EventModel EventModel-* Event
#         use GdmlManagement GdmlManagement-* DetectorDescription
#         use G4Geo G4Geo-* DetectorDescription
#         use TofCaliSvc TofCaliSvc-* Tof
#         use TofSimSvc TofSimSvc-* Tof
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use calibUtil * Calibration
#           use CalibData * Calibration
#           use CalibSvc * Calibration
#           use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#           use MYSQL MYSQL-00-00-* External
#         use TofQElecSvc TofQElecSvc-* Tof
#       use EventModel EventModel-* Event
#       use McTruth McTruth-* Event
#       use RawEvent RawEvent-* Event
#       use RawDataProviderSvc RawDataProviderSvc-* Event
#       use TrigEvent TrigEvent-* Event
#       use EvTimeEvent EvTimeEvent-* Event
#       use MdcFastTrkAlg MdcFastTrkAlg-* Reconstruction
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use ReconEvent ReconEvent-* Event
#         use EventModel EventModel-* Event
#         use MdcGeomSvc MdcGeomSvc-* Mdc
#         use McTruth McTruth-* Event
#         use MdcRecEvent MdcRecEvent-* Mdc
#         use BesCLHEP BesCLHEP-* External
#         use CERNLIB CERNLIB-* External
#         use PartPropSvc *  (no_version_directory)
#         use Identifier Identifier-* DetectorDescription
#         use BesAIDA BesAIDA-* External
#           use AIDA v* LCG_Interfaces (no_version_directory) (native_version=3.2.1)
#         use EvTimeEvent EvTimeEvent-* Event
#         use RawDataProviderSvc RawDataProviderSvc-* Event
#         use TrigEvent TrigEvent-* Event
#         use MagneticField MagneticField-* 
#         use TrackUtil TrackUtil-* Reconstruction
#           use MagneticField MagneticField-* 
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-01-* External
#           use BesCLHEP BesCLHEP-* External
#           use MdcRawEvent MdcRawEvent-* Mdc
#           use MdcRecEvent MdcRecEvent-* Mdc
#           use CERNLIB CERNLIB-* External
#         use RootHistCnv v*  (no_version_directory)
#         use BesTimerSvc BesTimerSvc-00-* Utilities
#       use MdcDedxAlg MdcDedxAlg-* Reconstruction
#       use TrackUtil TrackUtil-* Reconstruction
#       use Identifier Identifier-* DetectorDescription
#       use BesAIDA BesAIDA-* External
#       use BesTimerSvc BesTimerSvc-00-* Utilities
#       use PartPropSvc *  (no_version_directory)
#       use RootHistCnv v*  (no_version_directory)
#       use BesROOT BesROOT-* External
#       use RawEvent * Event
#       use MagneticField MagneticField-* 
#       use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#       use MdcUtilitySvc MdcUtilitySvc-* Mdc/MdcCheckUtil
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-* External
#         use MagneticField MagneticField-* 
#         use MdcRecEvent MdcRecEvent-* Mdc
#         use MdcGeomSvc MdcGeomSvc-* Mdc
#         use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#           use BesPolicy BesPolicy-01-* 
#           use GaudiInterface GaudiInterface-* External
#           use Identifier Identifier-* DetectorDescription
#           use MdcGeomSvc MdcGeomSvc-* Mdc
#           use BesCLHEP BesCLHEP-* External
#         use TrkBase TrkBase-* Reconstruction/MdcPatRec
#           use BesPolicy BesPolicy-01-* 
#           use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#           use MdcRecoUtil MdcRecoUtil-* Reconstruction/MdcPatRec
#             use BesPolicy BesPolicy-* 
#             use BesCLHEP BesCLHEP-* External
#           use ProxyDict ProxyDict-* Reconstruction/MdcPatRec
#             use BesPolicy BesPolicy-01-* 
#           use ProbTools ProbTools-* Reconstruction/MdcPatRec
#             use BesPolicy BesPolicy-01-* 
#           use BField BField-* Reconstruction/MdcPatRec
#             use BesPolicy BesPolicy-* 
#             use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#             use MagneticField MagneticField-* 
#           use BesCLHEP BesCLHEP-* External
#           use CERNLIB CERNLIB-* External
#           use BesBoost BesBoost-* External
#           use MdcRecEvent MdcRecEvent-* Mdc
#     use DedxCurSvc DedxCurSvc-* Mdc
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-* External
#       use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#       use MYSQL MYSQL-00-00-* External
#       use EventModel EventModel-* Event
#       use DatabaseSvc DatabaseSvc-* Database
#       use BesROOT BesROOT-* External
#       use BesCLHEP BesCLHEP-* External (private)
#     use CERNLIB CERNLIB-* External
#     use BesAIDA BesAIDA-* External
#     use RootHistCnv v*  (no_version_directory)
#   use MucRecAlg MucRecAlg-* Reconstruction
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use TofRawEvent TofRawEvent-* Tof
#     use EmcRawEvent EmcRawEvent-* Emc
#     use MucRawEvent MucRawEvent-* Muc
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use RawEvent RawEvent-* Event
#       use EventModel EventModel-* Event
#     use EventModel EventModel-* Event
#     use ExtEvent ExtEvent-* Event
#     use ReconEvent ReconEvent-* Event
#     use Identifier Identifier-* DetectorDescription
#     use PartPropSvc *  (no_version_directory)
#     use MucGeomSvc MucGeomSvc-* Muc
#     use MucRecEvent MucRecEvent-* Muc
#     use McTruth McTruth-* Event
#     use EmcRecEventModel EmcRecEventModel-01-* Emc
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use RootHistCnv v*  (no_version_directory)
#     use BesCLHEP BesCLHEP-* External (private)
#   use TofRec TofRec-* Reconstruction
#   use MdcTrkRecon MdcTrkRecon-* Reconstruction/MdcPatRec
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use EventModel EventModel-* Event
#     use McTruth McTruth-* Event
#     use BesCLHEP BesCLHEP-* External
#     use BesBoost BesBoost-* External
#     use BesAIDA BesAIDA-* External
#     use MdcData MdcData-* Reconstruction/MdcPatRec
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use EventModel EventModel-* Event
#       use RawEvent RawEvent-* Event
#       use MdcRawEvent MdcRawEvent-* Mdc
#       use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#       use Identifier Identifier-* DetectorDescription
#       use TrkBase TrkBase-* Reconstruction/MdcPatRec
#       use MdcRecoUtil MdcRecoUtil-* Reconstruction/MdcPatRec
#     use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#     use BField BField-* Reconstruction/MdcPatRec
#     use TrkFitter TrkFitter-* Reconstruction/MdcPatRec
#       use BesPolicy BesPolicy-01-* 
#       use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#       use BField BField-* Reconstruction/MdcPatRec
#       use BesCLHEP BesCLHEP-* External
#       use TrkBase TrkBase-* Reconstruction/MdcPatRec
#     use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#     use MagneticField MagneticField-* 
#     use RootHistCnv v*  (no_version_directory)
#     use EvTimeEvent EvTimeEvent-* Event
#     use ReconEvent ReconEvent-* Event
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#     use MdcPrintSvc MdcPrintSvc-* Mdc/MdcCheckUtil
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-* External
#       use EventModel EventModel-* Event
#       use McTruth McTruth-* Event
#       use RawDataProviderSvc RawDataProviderSvc-* Event
#       use EvtRecEvent EvtRecEvent-* Event
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use MdcRawEvent MdcRawEvent-* Mdc
#   use EmcRec EmcRec-* Reconstruction
#   use MdcFastTrkAlg MdcFastTrkAlg-* Reconstruction
#   use TrkExtAlg TrkExtAlg-* Reconstruction
#     use BesPolicy BesPolicy-01-* 
#     use BesCLHEP BesCLHEP-* External
#     use GdmlToG4 GdmlToG4-* External
#     use BesGeant4 BesGeant4-00-* External
#     use GaudiInterface GaudiInterface-01-* External
#     use MdcRecEvent MdcRecEvent* Mdc
#     use EventModel EventModel-* Event
#     use ExtEvent ExtEvent-* Event
#     use TofSim TofSim-* Simulation/BOOST
#     use SimUtil SimUtil-* Simulation/BOOST
#     use G4Geo G4Geo-* DetectorDescription
#     use TrackUtil TrackUtil-* Reconstruction
#     use MagneticField MagneticField-* 
#     use MucRawEvent MucRawEvent-* Muc
#     use MucGeomSvc MucGeomSvc-* Muc
#     use MucRecEvent MucRecEvent-* Muc
#     use MucCalibAlg MucCalibAlg-* Muc
#       use BesPolicy BesPolicy-* 
#       use Identifier Identifier-* DetectorDescription
#       use GaudiInterface GaudiInterface-* External
#       use McTruth McTruth-* Event
#       use EventModel EventModel-* Event
#       use DstEvent DstEvent-* Event
#       use EvTimeEvent EvTimeEvent-* Event
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use TofRecEvent TofRecEvent-* Tof
#       use EmcRecEventModel EmcRecEventModel-* Emc
#       use MucRawEvent MucRawEvent-* Muc
#       use MucRecEvent MucRecEvent-* Muc
#       use RootHistCnv v*  (no_version_directory)
#   use EsTimeAlg EsTimeAlg-* Reconstruction
# use MdcDedxAlg MdcDedxAlg-* Reconstruction
# use MucRecAlg MucRecAlg-* Reconstruction
# use TofRec TofRec-* Reconstruction
# use TofEnergyRec TofEnergyRec-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use Identifier Identifier-* DetectorDescription
#   use TofRawEvent TofRawEvent-* Tof
#   use TofRecEvent TofRecEvent-* Tof
#   use TofGeomSvc TofGeomSvc-* Tof
#   use TofCaliSvc TofCaliSvc-* Tof
#   use TofQCorrSvc TofQCorrSvc-* Tof
#   use TofQElecSvc TofQElecSvc-* Tof
#   use TofSim TofSim-* Simulation/BOOST
#   use TofRec TofRec-* Reconstruction
#   use EvTimeEvent EvTimeEvent-* Event
#   use AsciiDmp AsciiDmp-* Event
#   use EventModel EventModel-* Event
#   use RawEvent RawEvent-* Event
#   use ExtEvent ExtEvent-* Event
#   use McTruth McTruth-* Event
#   use ReconEvent ReconEvent-* Event
#   use RawDataProviderSvc RawDataProviderSvc-* Event
#   use RootHistCnv v*  (no_version_directory)
#   use BesCLHEP BesCLHEP-* External (private)
# use MdcTrkRecon MdcTrkRecon-* Reconstruction/MdcPatRec
# use MdcxReco MdcxReco-* Reconstruction/MdcPatRec
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use EventModel EventModel-* Event
#   use McTruth McTruth-* Event
#   use BesCLHEP BesCLHEP-* External
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#   use EvTimeEvent EvTimeEvent-* Event
#   use Identifier Identifier-* DetectorDescription
#   use BesAIDA BesAIDA-* External
#   use MdcData MdcData-* Reconstruction/MdcPatRec
#   use MdcGeom MdcGeom-* Reconstruction/MdcPatRec
#   use BField BField-* Reconstruction/MdcPatRec
#   use TrkFitter TrkFitter-* Reconstruction/MdcPatRec
#   use TrkBase TrkBase-* Reconstruction/MdcPatRec
#   use MdcRecoUtil MdcRecoUtil-* Reconstruction/MdcPatRec
#   use MdcTrkRecon MdcTrkRecon-* Reconstruction/MdcPatRec
#   use TrigEvent TrigEvent-* Event
#   use MdcUtilitySvc MdcUtilitySvc-* Mdc/MdcCheckUtil
#   use MdcPrintSvc MdcPrintSvc-* Mdc/MdcCheckUtil
#   use RootHistCnv v*  (no_version_directory)
# use EmcRec EmcRec-* Reconstruction
# use EmcTimeRec EmcTimeRec-* Reconstruction
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use EventModel EventModel-* Event
#   use EvTimeEvent EvTimeEvent-* Event
#   use EmcRecEventModel EmcRecEventModel-01-* Emc
# use MdcFastTrkAlg MdcFastTrkAlg-* Reconstruction
# use TrkExtAlg TrkExtAlg-* Reconstruction
# use EsTimeAlg EsTimeAlg-* Reconstruction
# use KalFitAlg KalFitAlg-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-* External
#   use CERNLIB CERNLIB-* External
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use BesCLHEP BesCLHEP-* External
#   use EventModel EventModel-* Event
#   use EvTimeEvent EvTimeEvent-* Event
#   use MdcTables MdcTables-* Mdc
#   use ReconEvent ReconEvent-* Event
#   use McTruth McTruth-* Event
#   use G4Svc G4Svc-00-* Simulation
#   use G4Geo * DetectorDescription
#   use RootHistCnv v*  (no_version_directory)
#   use BesROOT BesROOT-* External
#   use BesAIDA * External
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use MdcGeomSvc MdcGeomSvc-* Mdc
#   use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#   use MagneticField MagneticField-* 
#   use PartPropSvc *  (no_version_directory)
#   use VertexFit VertexFit-* Analysis
# use TrkReco TrkReco-* Reconstruction
#   use RawDataProviderSvc RawDataProviderSvc-* Event
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use RawEvent RawEvent-* Event
#   use EvTimeEvent EvTimeEvent-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use CERNLIB CERNLIB-* External
#   use BesCLHEP BesCLHEP-* External
#   use EventModel EventModel-* Event
#   use MdcGeomSvc MdcGeomSvc-* Mdc
#   use MdcTables MdcTables-* Mdc
#   use McTruth McTruth-* Event
#   use Identifier Identifier-* DetectorDescription
#   use RawDataProviderSvc RawDataProviderSvc-* Event
#   use TrackUtil TrackUtil-* Reconstruction
#   use RootHistCnv v*  (no_version_directory)
#   use BesAIDA * External
#   use BesTimerSvc BesTimerSvc-00-* Utilities
#   use G4Svc G4Svc-00-* Simulation
#   use G4Geo * DetectorDescription
#   use ReconEvent ReconEvent-* Event
#   use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
# use EventAssembly EventAssembly-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use EvtRecEvent EvtRecEvent-* Event
#   use EventModel EventModel-* Event
#   use EvTimeEvent EvTimeEvent-* Event
# use PrimaryVertexAlg PrimaryVertexAlg-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use McTruth McTruth-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use EvtRecEvent EvtRecEvent-* Event
#   use ReconEvent ReconEvent-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
# use VeeVertexAlg VeeVertexAlg-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use McTruth McTruth-* Event
#   use ReconEvent ReconEvent-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-* External
# use BeamParamsAlg BeamParamsAlg-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use McTruth McTruth-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use EvtRecEvent EvtRecEvent-* Event
#   use ReconEvent ReconEvent-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
# use DTagSkim DTagSkim-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use BesAIDA BesAIDA-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#   use EmcRawEvent EmcRawEvent-* Emc
#   use DTagAlg DTagAlg-* Reconstruction
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use DstEvent DstEvent-* Event
#     use EventModel EventModel-* Event
#     use EvtRecEvent EvtRecEvent-* Event
#     use DecayChain DecayChain-* Event
#       use BesPolicy BesPolicy-* 
#     use BesDChain BesDChain-* Event
#       use BesPolicy BesPolicy-* 
#       use BesCLHEP BesCLHEP-* External
#       use EvtRecEvent EvtRecEvent-* Event
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use EmcRecEventModel EmcRecEventModel-* Emc
#       use VertexFit VertexFit-* Analysis
#       use DecayChain DecayChain-* Event
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use McTruth McTruth-* Event
#     use ReconEvent ReconEvent-* Event
#     use ParticleID ParticleID-* Analysis
#     use VertexFit VertexFit-* Analysis
#     use BesROOT BesROOT-* External
#     use SimplePIDSvc SimplePIDSvc-* Utilities
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use EvtRecEvent EvtRecEvent-* Event
#     use DatabaseSvc DatabaseSvc-* Database
#   use RootIO RootIO-* Event
#     use GaudiKernel *  (no_version_directory)
#     use Gaudi *  (no_version_directory)
#       use GaudiSys v*  (no_version_directory)
#         use GaudiKernel v*  (no_version_directory)
#         use GaudiSvc v*  (no_auto_imports) (no_version_directory)
#         use GaudiAud v*  (no_auto_imports) (no_version_directory)
#           use GaudiKernel v*  (no_version_directory)
#         use GaudiAlg v*  (no_auto_imports) (no_version_directory)
#           use GaudiKernel v*  (no_version_directory)
#           use GaudiUtils v*  (no_version_directory)
#             use GaudiKernel v*  (no_version_directory)
#             use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#             use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#             use Boost v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.39.0_python2.5)
#             use uuid v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.38)
#               use LCG_Configuration v*  (no_version_directory)
#               use LCG_Settings v*  (no_version_directory)
#             use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#             use XercesC v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#           use ROOT v* LCG_Interfaces (no_version_directory) (native_version=5.24.00b)
#           use AIDA v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=3.2.1)
#           use Boost v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=1.39.0_python2.5)
#         use GaudiPython v*  (no_auto_imports) (no_version_directory)
#           use GaudiKernel v*  (no_version_directory)
#           use GaudiAlg v*  (no_version_directory)
#           use GaudiUtils v*  (no_version_directory)
#           use AIDA v* LCG_Interfaces (no_version_directory) (native_version=3.2.1)
#           use CLHEP v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.0.4.5)
#           use Python v* LCG_Interfaces (no_auto_imports) (no_version_directory) (native_version=2.5.4p2)
#           use Reflex v* LCG_Interfaces (no_auto_imports) (no_version_directory)
#           use GaudiSvc v*  (private) (no_auto_imports) (no_version_directory)
#     use ReconEvent ReconEvent-* Event
#     use RootCnvSvc RootCnvSvc-* Event
#       use BesCLHEP BesCLHEP-* External
#       use BesPolicy BesPolicy-01-* 
#       use DataInfoSvc DataInfoSvc-* Control
#         use BesPolicy BesPolicy-01-* 
#         use GaudiInterface GaudiInterface-01-* External
#       use BesROOT BesROOT-00-* External
#       use GaudiInterface GaudiInterface-* External
#       use Identifier Identifier-* DetectorDescription
#       use RawEvent RawEvent-* Event
#       use RootEventData RootEventData-* Event
#         use RootPolicy RootPolicy-* 
#         use BesROOT BesROOT-* External
#         use MucRecEvent MucRecEvent-* Muc
#         use Identifier Identifier-* DetectorDescription
#       use MdcRawEvent MdcRawEvent-* Mdc
#       use EventModel EventModel-* Event
#       use EmcRawEvent EmcRawEvent-* Emc
#       use TofRawEvent TofRawEvent-* Tof
#       use TofRecEvent TofRecEvent-* Tof
#       use MucRawEvent MucRawEvent-* Muc
#       use MucRecEvent MucRecEvent-* Muc
#       use EmcRecEventModel EmcRecEventModel-* Emc
#       use MdcRecEvent MdcRecEvent-* Mdc
#       use EvTimeEvent EvTimeEvent-* Event
#       use EvtRecEvent EvtRecEvent-* Event
#       use EventNavigator EventNavigator-* Event
#         use BesPolicy * 
#         use GaudiInterface * External
#         use McTruth McTruth-* Event
#         use EmcRecEventModel * Emc
#         use MdcRecEvent * Mdc
#         use MdcRawEvent * Mdc
#         use MucRecEvent * Muc
#         use TofRecEvent * Tof
#       use McTruth McTruth-* Event
#       use ExtEvent ExtEvent-* Event
#       use DstEvent DstEvent-* Event
#       use ReconEvent ReconEvent-* Event
#       use TrigEvent TrigEvent-* Event
#       use HltEvent HltEvent-* Event
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use RawEvent RawEvent-* Event
#         use EventModel EventModel-* Event
#         use Identifier Identifier-* DetectorDescription
#       use LumiDigi LumiDigi-* Event
#         use BesPolicy BesPolicy-* 
#         use GaudiInterface GaudiInterface-01-* External
#         use RawEvent RawEvent-* Event
#         use TofRawEvent TofRawEvent-* Tof
#     use BesROOT BesROOT-00-* External
#     use BesCLHEP BesCLHEP-* External
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use TofRawEvent TofRawEvent-* Tof
#     use EmcRawEvent EmcRawEvent-* Emc
#     use DstEvent DstEvent-* Event
#     use EventModel EventModel-* Event
#     use McTruth McTruth-* Event
#     use Identifier Identifier-* DetectorDescription
#     use RootPolicy RootPolicy-* 
#     use RootEventData RootEventData-* Event
# use LumTauAlg LumTauAlg-* 
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use McTruth McTruth-* Event
#   use RootHistCnv v*  (no_version_directory)
# use T0Dummy T0Dummy-* Reconstruction
#   use BesPolicy BesPolicy-01-* 
#   use EventModel EventModel-* Event
#   use McTruth McTruth-* Event
#   use EvTimeEvent EvTimeEvent-* Event
# use DiGamAlg DiGamAlg-* DQA
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use TofRecEvent TofRecEvent-* Tof
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use MucRecEvent MucRecEvent-* Muc
#   use ExtEvent ExtEvent-* Event
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use McTruth McTruth-* Event
#   use VertexFit VertexFit-* Analysis
#   use ParticleID ParticleID-* Analysis
#   use RootHistCnv v*  (no_version_directory)
#   use BesROOT BesROOT-00-* External
# use BesSim BesSim-* Simulation/BOOST
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use BesGeant4 BesGeant4-00-* External
#   use GdmlToG4 GdmlToG4-* External
#   use G4Svc G4Svc-00-* Simulation
#   use BesServices BesServices-* Control
#     use BesPolicy BesPolicy-* 
#     use BesKernel BesKernel-* Control
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use BesCLHEP * External (private)
#     use BesBoost BesBoost-* External
#     use BesCLHEP * External
#     use GaudiInterface GaudiInterface-* External
#     use GaudiSvc v*  (no_version_directory)
#   use BesROOT BesROOT-* External
#   use RootPolicy RootPolicy-* 
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use TofRawEvent TofRawEvent-* Tof
#   use EmcRawEvent EmcRawEvent-* Emc
#   use MucRawEvent MucRawEvent-* Muc
#   use Identifier Identifier-* DetectorDescription
#   use RawEvent RawEvent-* Event
#   use McTruth McTruth-* Event
#   use AsciiDmp AsciiDmp-* Event
#   use MagneticField MagneticField-* 
#   use RealizationSvc RealizationSvc-* Simulation/Realization
#   use RootEventData RootEventData-* Event
#   use SimUtil SimUtil-* Simulation/BOOST
#   use TruSim TruSim-* Simulation/BOOST
#   use MdcSim MdcSim-* Simulation/BOOST
#     use BesPolicy BesPolicy-01-* 
#     use BesGeant4 BesGeant4-00-* External
#     use BesCLHEP BesCLHEP-* External
#     use GdmlToG4 GdmlToG4-* External
#     use SimUtil SimUtil-* Simulation/BOOST
#     use TruSim TruSim-* Simulation/BOOST
#     use GaudiInterface GaudiInterface-01-* External
#     use MdcCalibFunSvc MdcCalibFunSvc-* Mdc
#     use MdcTunningSvc MdcTunningSvc-* Simulation/BOOST
#       use BesPolicy BesPolicy-01-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use EventModel EventModel-* Event
#       use DatabaseSvc * Database
#     use G4Svc G4Svc-00-* Simulation
#     use BesROOT * External
#     use G4Geo G4Geo-* DetectorDescription
#     use calibUtil * Calibration
#     use CalibData * Calibration
#     use DedxCurSvc DedxCurSvc-* Mdc
#   use TofSim TofSim-* Simulation/BOOST
#   use EmcSim EmcSim-* Simulation/BOOST
#     use BesPolicy BesPolicy-01-* 
#     use BesGeant4 BesGeant4-00-* External
#     use GdmlToG4 GdmlToG4-* External
#     use SimUtil SimUtil-* Simulation/BOOST
#     use TruSim TruSim-* Simulation/BOOST
#     use GaudiInterface GaudiInterface-* External
#     use G4Svc G4Svc-* Simulation
#     use G4Geo G4Geo-* DetectorDescription
#     use Identifier Identifier-* DetectorDescription
#     use EmcGeneralClass EmcGeneralClass-* Emc
#     use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#   use MucSim MucSim-* Simulation/BOOST
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use BesGeant4 BesGeant4-00-* External
#     use GdmlToG4 GdmlToG4-* External
#     use SimUtil SimUtil-* Simulation/BOOST
#     use TruSim TruSim-* Simulation/BOOST
#     use G4Geo G4Geo-* DetectorDescription
#     use BesROOT BesROOT-* External
#     use G4Svc G4Svc-* Simulation
#     use MucCalibConstSvc MucCalibConstSvc-* Muc
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-* External
#       use CalibSvc CalibSvc-* Calibration
#       use CalibData CalibData-* Calibration
#       use CalibDataSvc CalibDataSvc-* Calibration/CalibSvc
#     use MucCalibAlg MucCalibAlg-* Muc
#   use GenSim GenSim-* Simulation/BOOST
#     use BesPolicy BesPolicy-01-* 
#     use BesGeant4 BesGeant4-00-* External
#     use BesROOT BesROOT-* External
#   use PhySim PhySim-* Simulation/BOOST
#     use BesPolicy BesPolicy-01-* 
#     use BesGeant4 BesGeant4-00-* External
#   use EventNavigator EventNavigator-* Event
# use MdcTunningSvc MdcTunningSvc-* Simulation/BOOST
# use BesEventMixer BesEventMixer-* Simulation
#   use BesPolicy * 
#   use GaudiInterface * External
#   use BesCLHEP * External
#   use DataInfoSvc DataInfoSvc-* Control
#   use IRawFile IRawFile-* Event
#     use BesPolicy BesPolicy-01-* 
#   use RawFile RawFile-* Event
#     use BesPolicy BesPolicy-* 
#     use BesExternalArea BesExternalArea-* External
#     use IRawFile IRawFile-* Event
#     use XmlRpcC XmlRpcC-* External
#       use BesExternalArea BesExternalArea-* External
#   use RawDataCnv * Event
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use RawFile RawFile-* Event
#     use EventModel EventModel-* Event
#     use RawDataCnvBase RawDataCnvBase-* Event
#       use BesPolicy BesPolicy-* 
#       use GaudiInterface GaudiInterface-01-* External
#       use EventModel EventModel-* Event
#     use RawEvent RawEvent-00-* Event
#     use McTruth McTruth-* Event
#     use Identifier Identifier-* DetectorDescription
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use TofRawEvent TofRawEvent-* Tof
#     use EmcRawEvent EmcRawEvent-* Emc
#     use MucRawEvent MucRawEvent-* Muc
#     use TrigEvent TrigEvent-* Event
#     use HltEvent HltEvent-* Event
#     use LumiDigi LumiDigi-* Event
#     use eformat eformat-* Event
#       use BesPolicy BesPolicy-* 
#       use ers ers-* Event
#         use BesPolicy BesPolicy-* 
#     use TofSim TofSim-* Simulation/BOOST
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#     use NetDataReader NetDataReader-* DistBoss (private)
#       use BesPolicy BesPolicy-* 
#       use IRawFile IRawFile-* Event
#       use DimSetup DimSetup-* DistBoss
#         use BesExternalArea BesExternalArea-* External
#       use DistBossUtil DistBossUtil-* DistBoss
#         use BesPolicy BesPolicy-* 
#         use IRawFile IRawFile-* Event
#       use ClientErrHandler ClientErrHandler-* DistBoss
#         use BesPolicy BesPolicy-* 
#         use DimSetup DimSetup-* DistBoss
#         use DistBossUtil DistBossUtil-* DistBoss
#   use RawEvent * Event
#   use RootCnvSvc * Event
#   use HltEvent HltEvent-* Event
#   use TrigEvent TrigEvent-* Event
#   use RealizationSvc RealizationSvc-* Simulation/Realization
#   use EventModel EventModel-* Event
#   use BesTimerSvc BesTimerSvc-* Utilities
#   use BesServices BesServices-* Control
# use Trigger Trigger-* Trigger
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use BesROOT * External
#   use BesCLHEP * External
#   use BesAIDA BesAIDA-* External
#   use RealizationSvc RealizationSvc-* Simulation/Realization
#   use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#   use RawDataProviderSvc RawDataProviderSvc-* Event
#   use MdcGeomSvc MdcGeomSvc-* Mdc
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use TofRawEvent TofRawEvent-* Tof
#   use EmcRawEvent EmcRawEvent-* Emc
#   use MucRawEvent MucRawEvent-* Muc
#   use EmcWaveform EmcWaveform-* Emc
#   use TrigEvent TrigEvent-* Event
#   use McTruth McTruth-* Event
#   use RawEvent RawEvent-* Event
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use Identifier Identifier-* DetectorDescription
# use TrigMakerAlg TrigMakerAlg-* Event
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use TrigEvent TrigEvent-* Event
#   use EventModel EventModel-* Event
# use EventFilter EventFilter-* 
#   use HltTools HltTools-* EventFilter/HltUtilities
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#   use HltDataTypes HltDataTypes-* EventFilter/HltUtilities
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#   use HltStore HltStore-* EventFilter/HltUtilities
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#   use HltAlgorithms HltAlgorithms-* EventFilter/HltUtilities
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use HltStore HltStore-* EventFilter/HltUtilities
#     use HltDataTypes HltDataTypes-* EventFilter/HltUtilities
#     use RawEvent RawEvent-* Event
#     use EmcRawEvent EmcRawEvent-* Emc
#     use MdcRawEvent MdcRawEvent-* Mdc
#     use TofRawEvent TofRawEvent-* Tof
#     use MucRawEvent MucRawEvent-* Muc
#     use HltEvent HltEvent-* Event
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use EventModel EventModel-* Event
#     use RawDataProviderSvc RawDataProviderSvc-* Event
#     use RootHistCnv v*  (no_version_directory)
#   use HltSteerData HltSteerData-* EventFilter/HltProcessor
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use HltTools HltTools-* EventFilter/HltUtilities
#     use HltStore HltStore-* EventFilter/HltUtilities
#     use HltDataTypes HltDataTypes-* EventFilter/HltUtilities
#   use HltConfig HltConfig-* EventFilter/HltProcessor
#     use BesPolicy BesPolicy-* 
#     use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#     use GaudiInterface GaudiInterface-* External
#     use DatabaseSvc DatabaseSvc-* Database
#     use EventModel EventModel-* Event
#     use HltSteerData HltSteerData-* EventFilter/HltProcessor
#     use HltTools HltTools-* EventFilter/HltUtilities
#   use HltSteering HltSteering-* EventFilter/HltProcessor
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use HltDataTypes HltDataTypes-* EventFilter/HltUtilities
#     use HltStore HltStore-* EventFilter/HltUtilities
#     use HltAlgorithms HltAlgorithms-* EventFilter/HltUtilities
#     use HltSteerData HltSteerData-* EventFilter/HltProcessor
#     use HltConfig HltConfig-* EventFilter/HltProcessor
#   use HltEvent HltEvent-* Event
#   use TrigEvent TrigEvent-* Event
#   use TofRawEvent TofRawEvent-* Tof
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use EmcRawEvent EmcRawEvent-* Emc
#   use MucRawEvent MucRawEvent-* Muc
#   use efhlt efhlt-* EventFilter/OnlineJointer
#   use EFServices EFServices-* EventFilter/OnlineJointer
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use GaudiSvc v*  (no_version_directory)
#     use RawDataCnv RawDataCnv-* Event
#     use HltDataTypes HltDataTypes-* EventFilter/HltUtilities
#     use HltStore HltStore-* EventFilter/HltUtilities
#   use ESController ESController-* EventFilter/OnlineJointer
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use eformat eformat-* Event
#     use HltTools HltTools-* EventFilter/HltUtilities
#     use EFServices EFServices-* EventFilter/OnlineJointer
#     use efhlt efhlt-00-* EventFilter/OnlineJointer
# use HltMakerAlg HltMakerAlg-* Event
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use HltEvent HltEvent-* Event
#   use EventModel EventModel-* Event
#   use Identifier Identifier-* DetectorDescription
#   use TofRawEvent TofRawEvent-* Tof
#   use DstMakerAlg DstMakerAlg-* Event
#     use BesPolicy BesPolicy-01-* 
#     use GaudiInterface GaudiInterface-01-* External
#     use MdcRecEvent MdcRecEvent-* Mdc
#     use TofRecEvent TofRecEvent-* Tof
#     use EmcRecEventModel EmcRecEventModel-* Emc
#     use MucRecEvent MucRecEvent-* Muc
#     use ExtEvent ExtEvent-* Event
#     use BesCLHEP BesCLHEP-* External
#     use BesROOT BesROOT-* External
#     use DstEvent DstEvent-* Event
#     use EventModel EventModel-* Event
# use EventPreSelect EventPreSelect-* EvtPreSelect
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#   use EmcRawEvent EmcRawEvent-* Emc
#   use MucRawEvent MucRawEvent-* Muc
#   use MdcRawEvent * Mdc
# use EventWriter EventWriter-* EvtPreSelect
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use GaudiSvc *  (no_version_directory)
#   use RootPolicy RootPolicy-* 
#   use BesROOT BesROOT-* External
#   use BesCLHEP BesCLHEP-* External
#   use EvtRecEvent EvtRecEvent-* Event
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use TofRecEvent TofRecEvent-* Tof
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use MucRecEvent MucRecEvent-* Muc
#   use EmcRec EmcRec-* Reconstruction
#   use RootCnvSvc RootCnvSvc-* Event
#   use EventModel EventModel-* Event
#   use ExtEvent ExtEvent-* Event
#   use DstEvent DstEvent-* Event
#   use RootEventData RootEventData-* Event
#   use DataInfoSvc DataInfoSvc-* Control
#   use DistBossUtil DistBossUtil-* DistBoss
#   use NetDataWriter NetDataWriter-* DistBoss
#     use BesPolicy BesPolicy-* 
#     use GaudiInterface GaudiInterface-* External
#     use DimSetup DimSetup-* DistBoss
#     use DistBossUtil DistBossUtil-* DistBoss
#     use ClientErrHandler ClientErrHandler-* DistBoss
# use CalibEventSelect CalibEventSelect-* EvtPreSelect
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use BesAIDA BesAIDA-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use ParticleID ParticleID-* Analysis
#   use DTagAlg DTagAlg-* Reconstruction
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use EmcCalibConstSvc EmcCalibConstSvc-* Emc
#   use EmcRawEvent EmcRawEvent-* Emc
#   use RootIO RootIO-* Event
# use DimuPreSelect DimuPreSelect-* EvtPreSelect
#   use BesPolicy BesPolicy-01-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use MdcRawEvent MdcRawEvent-* Mdc
#   use MucRawEvent MucRawEvent-* Muc
#   use ParticleID ParticleID-* Analysis
#   use VertexFit VertexFit-* Analysis
#   use BesROOT BesROOT-00-* External
#   use EmcRecEventModel EmcRecEventModel-01-* Emc
#   use RootHistCnv v*  (no_version_directory)
# use Gam4pikpAlg Gam4pikpAlg-* Analysis/ControlSamples
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use McTruth McTruth-* Event
#   use DstEvent DstEvent-* Event
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use HltEvent HltEvent-* Event
#   use VertexFit VertexFit-* Analysis
#   use ParticleID ParticleID-* Analysis
#   use BesROOT BesROOT-* External
# use RootIO RootIO-* Event
# use RawDataCnv RawDataCnv-* Event
# use RawDataProviderSvc RawDataProviderSvc-* Event
# use MagneticField MagneticField-* 
# use BesVisAlg * EventDisplay
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use RootPolicy RootPolicy-* 
#   use BesROOT BesROOT-* External
#   use BesCLHEP BesCLHEP-* External
#   use MdcRecEvent MdcRecEvent-* Mdc
#   use TofRecEvent TofRecEvent-* Tof
#   use EmcRecEventModel EmcRecEventModel-* Emc
#   use MucRecEvent MucRecEvent-* Muc
#   use RootCnvSvc RootCnvSvc-* Event
#   use EventModel EventModel-* Event
#   use ExtEvent ExtEvent-* Event
#   use DstEvent DstEvent-* Event
#   use BesVisLib BesVisLib-* EventDisplay
#     use BesPolicy BesPolicy-01-* 
#     use RootPolicy RootPolicy-* 
#     use BesROOT BesROOT-* External
#     use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#     use BesCLHEP BesCLHEP-* External
#     use GdmlToRoot GdmlToRoot-* External
#     use RootEventData RootEventData-* Event
#     use Identifier Identifier-* DetectorDescription
#     use RawEvent RawEvent-* Event
#   use BesVisClient BesVisClient-* EventDisplay
#     use BesPolicy BesPolicy-* 
#     use RootPolicy RootPolicy-* 
#     use BesROOT BesROOT-* External
#     use XercesC * LCG_Interfaces (no_version_directory) (native_version=2.8.0)
#     use BesCLHEP BesCLHEP-* External
#     use GdmlToRoot GdmlToRoot-* External
#     use RootEventData * Event
#     use Identifier Identifier-* DetectorDescription
#     use BesVisLib BesVisLib-* EventDisplay
# use PartPropSvc *  (no_version_directory)
# use KKMC KKMC-* Generator
#   use BesPolicy BesPolicy-* 
#   use BesFortranPolicy BesFortranPolicy-* 
#   use BesServices BesServices-* Control
#   use CERNLIB CERNLIB-* External
#   use GeneratorObject GeneratorObject-* Generator
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#   use DatabaseSvc DatabaseSvc-* Database
# use BesEvtGen BesEvtGen-* Generator
#   use BesPolicy BesPolicy-* 
#   use BesServices BesServices-* Control
#   use CERNLIB CERNLIB-* External
#   use GeneratorObject GeneratorObject-* Generator
#   use BesEvtGen BesEvtGen-* Generator
#   use PartPropSvc *  (no_version_directory)
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#   use DataInfoSvc DataInfoSvc-* Control
#   use BesROOT BesROOT-* External
# use Bhwide Bhwide-* Generator
#   use BesPolicy BesPolicy-* 
#   use BesKernel * Control
#   use CERNLIB CERNLIB-* External
#   use GeneratorObject GeneratorObject-* Generator
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#   use BesCLHEP BesCLHEP-* External
# use Bhagen Bhagen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#     use BesPolicy BesPolicy-* 
#     use PartPropSvc *  (no_version_directory)
#     use GaudiInterface GaudiInterface-* External
#     use GeneratorObject GeneratorObject-* Generator
#     use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#     use BesServices BesServices-* Control
#     use BesCLHEP * External (private)
#   use GeneratorUtil GeneratorUtil-00-* Generator
#     use BesPolicy BesPolicy-* 
#   use bhagen bhagen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#       use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#   use BesGenModule BesGenModule-* Generator
#     use McTruth McTruth-* Event
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Ddgen Ddgen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use ddgen ddgen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Ddprod Ddprod-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use ddprod ddprod-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Dsdgen Dsdgen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use dsdgen dsdgen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Dssgen Dssgen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use dssgen dssgen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Epscat Epscat-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use epscat epscat-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Fff Fff-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use fff fff-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Ffgen Ffgen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use ffgen ffgen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Fsfgen Fsfgen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use fsfgen fsfgen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
# use Gamma2 Gamma2-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use gamma2 gamma2-* External/GENBES
#     use BesExternalArea BesExternalArea-* External
#     use CERNLIB CERNLIB-01-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Howl Howl-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use howl howl-* External/GENBES (native_version=genbes-00-00-10)
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Koralbe Koralbe-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use koralbe koralbe-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use KK2f KK2f-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use kk2f kk2f-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Kstark Kstark-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use kstark kstark-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Lund Lund-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use lund lund-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Lund_crm Lund_crm-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use lund_crm lund_crm-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Mugen Mugen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use mugen mugen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use P2bb P2bb-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use p2bb p2bb-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use P2epem P2epem-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use p2epem p2epem-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use P2mumu P2mumu-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use p2mumu p2mumu-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Ppgen Ppgen-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use ppgen ppgen-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Radee Radee-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use radee radee-* External/GENBES (native_version=genbes-00-00-10)
#     use CERNLIB CERNLIB-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Radgg Radgg-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use radgg radgg-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Radmu Radmu-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use radmu radmu-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Rhopi Rhopi-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use rhopi rhopi-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Sagerx Sagerx-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use sagerx sagerx-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Tauprd Tauprd-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use tauprd tauprd-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Tester Tester-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
#   use tester tester-* External/GENBES (native_version=genbes-00-00-10)
#     use CERNLIB CERNLIB-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
# use Twogam Twogam-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use twogam twogam-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use V2llg V2llg-* Generator/BesGenInterface
#   use BesPolicy BesPolicy-* 
#   use GeneratorModule GeneratorModule-* Generator
#   use GeneratorUtil GeneratorUtil-00-* Generator
#   use v2llg v2llg-* External/GENBES
#     use CERNLIB CERNLIB-01-* External
#     use BesExternalArea BesExternalArea-* External
#     use GENBES * External (native_version=genbes-00-00-10)
#   use BesGenModule BesGenModule-* Generator
#   use BesServices BesServices-* Control
#   use HepMC * LCG_Interfaces (no_version_directory) (native_version=2.03.11)
# use Babayaga Babayaga-* Generator
#   use BesPolicy BesPolicy-* 
#   use BesServices BesServices-* Control
#   use CERNLIB CERNLIB-* External
#   use GeneratorObject GeneratorObject-* Generator
#   use HepMC HepMC-* LCG_Interfaces (no_version_directory)
#   use BesCLHEP BesCLHEP-* External
# use RunEventNumberAlg RunEventNumberAlg-* Event
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-* External
#   use EventModel EventModel-* Event
# use Pi0EtaToGGRecAlg Pi0EtaToGGRecAlg-* Reconstruction
#   use BesPolicy BesPolicy-* 
#   use GaudiInterface GaudiInterface-01-* External
#   use EventModel EventModel-* Event
#   use EvtRecEvent EvtRecEvent-* Event
#   use VertexFit VertexFit-* Analysis
# use DTagAlg DTagAlg-* Reconstruction
# use DummyLoadOldROOT DummyLoadOldROOT-* Utilities
#
# Selection :
use CMT v1r20p20081118 (/afs/ihep.ac.cn/bes3/offline/ExternalLib/contrib)
use efhlt efhlt-00-00-05 EventFilter/OnlineJointer (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesExternalArea BesExternalArea-00-00-21 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DimSetup DimSetup-00-00-05 DistBoss (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use XmlRpcC XmlRpcC-00-00-01 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GdmlManagement GdmlManagement-00-00-31 DetectorDescription (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use LCG_Configuration v1  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5)
use LCG_SettingsCompat v1  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5)
use LCG_Settings v1  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5)
use uuid v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use blas v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use lapack v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use cernlib v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use sqlite v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use mysql v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use MYSQL MYSQL-00-00-09 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use XercesC v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesFortranPolicy BesFortranPolicy-00-01-03  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use CASTOR v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use CERNLIB CERNLIB-01-02-02 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HepPDT v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use HepMC v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use GENBES GENBES-00-00-05 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use v2llg v2llg-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use twogam twogam-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use tester tester-00-00-11 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use tauprd tauprd-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use sagerx sagerx-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use rhopi rhopi-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use radmu radmu-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use radgg radgg-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use radee radee-00-00-09 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ppgen ppgen-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use p2mumu p2mumu-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use p2epem p2epem-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use p2bb p2bb-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use mugen mugen-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use lund_crm lund_crm-00-00-09 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use lund lund-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use kstark kstark-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use kk2f kk2f-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use koralbe koralbe-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use howl howl-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use gamma2 gamma2-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use fsfgen fsfgen-00-00-09 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ffgen ffgen-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use fff fff-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use epscat epscat-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use dssgen dssgen-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use dsdgen dsdgen-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ddprod ddprod-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ddgen ddgen-00-00-07 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use bhagen bhagen-00-00-08 External/GENBES (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use PCRE v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use AIDA v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesAIDA BesAIDA-00-00-01 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CLHEP v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesCLHEP BesCLHEP-00-00-09 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesGeant4 BesGeant4-00-00-09 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GdmlToG4 GdmlToG4-00-00-10 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CppUnit v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use GCCXML v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use tcmalloc v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use Python v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/) (no_auto_imports)
use Boost v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesBoost BesBoost-00-00-01 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ROOT v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use BesROOT BesROOT-00-00-07 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GdmlToRoot GdmlToRoot-00-00-13 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Reflex v1 LCG_Interfaces (/afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5/)
use GaudiPolicy v10r4  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use BesCxxPolicy BesCxxPolicy-00-01-01  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use BesPolicy BesPolicy-01-05-03  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use GeneratorUtil GeneratorUtil-00-00-03 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ers ers-00-00-02 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use eformat eformat-00-00-04 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use IRawFile IRawFile-00-00-03 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DistBossUtil DistBossUtil-00-00-02 DistBoss (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ClientErrHandler ClientErrHandler-00-00-01 DistBoss (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use NetDataReader NetDataReader-00-00-04 DistBoss (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RawFile RawFile-00-00-08 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use PhySim PhySim-00-00-10 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GenSim GenSim-00-00-07 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DecayChain DecayChain-00-00-03 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ProbTools ProbTools-00-00-01 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ProxyDict ProxyDict-00-00-01 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcRecoUtil MdcRecoUtil-00-01-08 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RootPolicy RootPolicy-00-01-02  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use AsciiDmp AsciiDmp-01-03-01 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use SimUtil SimUtil-00-00-37 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Identifier Identifier-00-02-13 DetectorDescription (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcGeneralClass EmcGeneralClass-00-00-03 Emc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use facilities facilities-00-00-03 Calibration (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use xmlBase xmlBase-00-00-02 Calibration (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use rdbModel rdbModel-00-01-00 Calibration (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GaudiKernel v27r6  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiUtils v3r5  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use GaudiAlg v12r4  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use GaudiAud v9r1  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use RootHistCnv v10r2  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiSvc v18r6  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiPython v10r6  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5) (no_auto_imports)
use GaudiSys v21r6  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use Gaudi v21r6  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use PartPropSvc v3r2  (/afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5)
use GaudiInterface GaudiInterface-01-03-07 External (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use NetDataWriter NetDataWriter-00-00-03 DistBoss (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltStore HltStore-01-00-04 EventFilter/HltUtilities (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltDataTypes HltDataTypes-01-01-02 EventFilter/HltUtilities (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltTools HltTools-01-00-02 EventFilter/HltUtilities (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltSteerData HltSteerData-01-00-03 EventFilter/HltProcessor (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesKernel BesKernel-00-00-03 Control (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesServices BesServices-00-00-10 Control (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DataInfoSvc DataInfoSvc-00-00-03 Control (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcWaveform EmcWaveform-00-00-03 Emc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofGeomSvc TofGeomSvc-00-00-12 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TrigEvent TrigEvent-00-01-01 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesTimerSvc BesTimerSvc-00-00-12 Utilities (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use G4Geo G4Geo-00-00-11 DetectorDescription (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ROOTGeo ROOTGeo-00-00-15 DetectorDescription (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucGeomSvc MucGeomSvc-00-02-25 Muc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcRecGeoSvc EmcRecGeoSvc-01-01-07 Emc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RelTable RelTable-00-00-02 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibData CalibData-00-01-09 Calibration (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DatabaseSvc DatabaseSvc-00-00-24 Database (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use calibUtil calibUtil-00-00-38 Calibration (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EventModel EventModel-01-05-31 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RunEventNumberAlg RunEventNumberAlg-00-00-02 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltConfig HltConfig-01-01-04 EventFilter/HltProcessor (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TrigMakerAlg TrigMakerAlg-00-00-01 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RawDataCnvBase RawDataCnvBase-01-00-03 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcTunningSvc MdcTunningSvc-00-00-26 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DedxCurSvc DedxCurSvc-00-00-17 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GeneratorObject GeneratorObject-00-01-05 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Babayaga Babayaga-00-00-24 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use GeneratorModule GeneratorModule-00-01-05 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Bhwide Bhwide-00-00-10 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesEvtGen BesEvtGen-00-01-94 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use KKMC KKMC-00-00-44 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TruSim TruSim-00-00-17 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use OfflineEventLoopMgr OfflineEventLoopMgr-00-00-13 Control (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofQCorrSvc TofQCorrSvc-00-00-09 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RawEvent RawEvent-00-03-19 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltEvent HltEvent-00-02-06 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucRawEvent MucRawEvent-00-02-02 Muc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcRawEvent EmcRawEvent-00-02-05 Emc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofRawEvent TofRawEvent-00-02-07 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use LumiDigi LumiDigi-00-00-02 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcRawEvent MdcRawEvent-00-03-08 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use McTruth McTruth-00-02-19 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesGenModule BesGenModule-00-00-12 Generator (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use V2llg V2llg-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Twogam Twogam-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Tester Tester-00-01-04 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Tauprd Tauprd-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Sagerx Sagerx-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Rhopi Rhopi-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Radmu Radmu-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Radgg Radgg-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Radee Radee-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Ppgen Ppgen-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use P2mumu P2mumu-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use P2epem P2epem-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use P2bb P2bb-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Mugen Mugen-00-01-06 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Lund_crm Lund_crm-00-01-06 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Lund Lund-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Kstark Kstark-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use KK2f KK2f-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Koralbe Koralbe-00-01-06 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Howl Howl-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Gamma2 Gamma2-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Fsfgen Fsfgen-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Ffgen Ffgen-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Fff Fff-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Epscat Epscat-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Dssgen Dssgen-00-01-06 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Dsdgen Dsdgen-00-01-06 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Ddprod Ddprod-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Ddgen Ddgen-00-01-05 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Bhagen Bhagen-00-01-04 Generator/BesGenInterface (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MagneticField MagneticField-00-01-38  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use MdcGeomSvc MdcGeomSvc-00-01-37 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcGeom MdcGeom-00-01-17 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BField BField-00-01-02 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DedxCorrecSvc DedxCorrecSvc-00-02-52 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EvTimeEvent EvTimeEvent-00-00-08 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use T0Dummy T0Dummy-00-00-05 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DstEvent DstEvent-00-02-50-p01 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibDataSvc CalibDataSvc-00-01-03 Calibration/CalibSvc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibXmlCnvSvc CalibXmlCnvSvc-00-01-01 Calibration/CalibSvc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibMySQLCnv CalibMySQLCnv-00-01-09 Calibration/CalibSvc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibTreeCnv CalibTreeCnv-00-01-12 Calibration/CalibSvc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibROOTCnv CalibROOTCnv-00-01-06 Calibration/CalibSvc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcCalibConstSvc EmcCalibConstSvc-00-00-10 Emc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RealizationSvc RealizationSvc-00-00-35 Simulation/Realization (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use G4Svc G4Svc-00-01-51 Simulation (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcSim EmcSim-00-00-43 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibSvc CalibSvc-00-01-93 Calibration (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucCalibConstSvc MucCalibConstSvc-00-01-10 Muc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofSimSvc TofSimSvc-00-00-04 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EstTofCaliSvc EstTofCaliSvc-00-00-08 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcCalibFunSvc MdcCalibFunSvc-00-03-15 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcSim MdcSim-00-00-70 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofQElecSvc TofQElecSvc-00-00-04 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofCaliSvc TofCaliSvc-00-01-05 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofSim TofSim-00-02-07 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ExtEvent ExtEvent-00-00-13 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ReconEvent ReconEvent-00-00-04 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucRecEvent MucRecEvent-00-02-50-p01 Muc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RootEventData RootEventData-00-03-78 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesVisLib BesVisLib-00-04-03 EventDisplay (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesVisClient BesVisClient-00-04-03 EventDisplay (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcRecEventModel EmcRecEventModel-01-01-18 Emc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcTimeRec EmcTimeRec-00-00-03 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofRecEvent TofRecEvent-00-02-14 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcRecEvent MdcRecEvent-00-05-14 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DstMakerAlg DstMakerAlg-00-02-28 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltMakerAlg HltMakerAlg-00-00-05 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EventNavigator EventNavigator-00-01-03 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucCalibAlg MucCalibAlg-00-02-16 Muc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucSim MucSim-00-01-03 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesSim BesSim-00-01-22 Simulation/BOOST (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MucRecAlg MucRecAlg-00-03-07 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TrkBase TrkBase-00-01-11 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TrkFitter TrkFitter-00-01-11 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcData MdcData-00-01-27 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcUtilitySvc MdcUtilitySvc-00-00-07 Mdc/MdcCheckUtil (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TrackUtil TrackUtil-00-00-08 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TrkExtAlg TrkExtAlg-00-00-58-p02 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcTables MdcTables-00-00-11 Mdc (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RawDataProviderSvc RawDataProviderSvc-00-03-38 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltAlgorithms HltAlgorithms-01-03-00 EventFilter/HltUtilities (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use HltSteering HltSteering-01-01-04 EventFilter/HltProcessor (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RawDataCnv RawDataCnv-00-04-23-p01 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EFServices EFServices-00-01-08 EventFilter/OnlineJointer (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ESController ESController-00-01-04 EventFilter/OnlineJointer (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EventFilter EventFilter-02-00-10  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use TrkReco TrkReco-00-08-59-p04 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcFastTrkAlg MdcFastTrkAlg-00-04-09 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EmcRec EmcRec-01-02-52 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofRec TofRec-00-04-30 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use TofEnergyRec TofEnergyRec-00-00-07 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use tofcalgsec tofcalgsec-00-02-08 Tof (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EvtRecEvent EvtRecEvent-00-01-04 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Trigger Trigger-00-01-05 Trigger (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RootCnvSvc RootCnvSvc-02-01-03 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesVisAlg BesVisAlg-00-01-07 EventDisplay (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EventWriter EventWriter-00-00-17 EvtPreSelect (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BesEventMixer BesEventMixer-00-00-32 Simulation (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RootIO RootIO-00-01-31 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use SimplePIDSvc SimplePIDSvc-00-00-06 Utilities (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EventAssembly EventAssembly-00-00-16 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcPrintSvc MdcPrintSvc-00-00-01 Mdc/MdcCheckUtil (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcTrkRecon MdcTrkRecon-00-03-44 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcxReco MdcxReco-00-01-59 Reconstruction/MdcPatRec (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EsTimeAlg EsTimeAlg-00-02-52 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use MdcDedxAlg MdcDedxAlg-00-06-57 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Reconstruction Reconstruction-00-00-16  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use ParticleID ParticleID-00-04-54 Analysis (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use VertexFit VertexFit-00-02-69 Analysis (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Pi0EtaToGGRecAlg Pi0EtaToGGRecAlg-00-00-09 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use Gam4pikpAlg Gam4pikpAlg-00-00-08 Analysis/ControlSamples (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DimuPreSelect DimuPreSelect-00-00-09 EvtPreSelect (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use EventPreSelect EventPreSelect-00-00-21 EvtPreSelect (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DiGamAlg DiGamAlg-00-00-22 DQA (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use LumTauAlg LumTauAlg-00-00-04  (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01)
use BesDChain BesDChain-00-00-14 Event (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DTagAlg DTagAlg-00-00-49 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use CalibEventSelect CalibEventSelect-00-00-15 EvtPreSelect (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use DTagSkim DTagSkim-00-00-06 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use BeamParamsAlg BeamParamsAlg-00-00-10 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use VeeVertexAlg VeeVertexAlg-00-00-05 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use PrimaryVertexAlg PrimaryVertexAlg-00-00-04 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use KalFitAlg KalFitAlg-00-07-55-p03 Reconstruction (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use AbsCor AbsCor-00-00-28 Analysis/PhotonCor (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use PipiJpsiAlg PipiJpsiAlg-00-00-03 Analysis/Physics/PsiPrime (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use RhopiAlg RhopiAlg-00-00-23 Analysis/Physics (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
use ExHelloWorld ExHelloWorld-00-00-03 BesExamples (/afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01/)
----------> tags
CMTv1 (from CMTVERSION)
CMTr20 (from CMTVERSION)
CMTp20081118 (from CMTVERSION)
Linux (from uname) package BesPolicy implies [Unix host-linux]
x86_64-slc5-gcc43-opt (from CMTCONFIG) package LCG_Settings implies [Linux slc5-amd64 gcc43 optimized target-linux target-x86_64 target-slc5 target-gcc43 target-opt]
kpi_no_config (from PROJECT) excludes [kpi_config]
kpi_root (from PROJECT) excludes [kpi_no_root]
kpi_cleanup (from PROJECT) excludes [kpi_no_cleanup]
kpi_no_prototypes (from PROJECT) excludes [kpi_prototypes]
kpi_with_installarea (from PROJECT) excludes [kpi_without_installarea]
kpi_with_version_directory (from PROJECT) excludes [kpi_without_version_directory]
kpi (from PROJECT)
BOSS_no_config (from PROJECT) excludes [BOSS_config]
BOSS_root (from PROJECT) excludes [BOSS_no_root]
BOSS_cleanup (from PROJECT) excludes [BOSS_no_cleanup]
BOSS_no_prototypes (from PROJECT) excludes [BOSS_prototypes]
BOSS_with_installarea (from PROJECT) excludes [BOSS_without_installarea]
BOSS_with_version_directory (from PROJECT) excludes [BOSS_without_version_directory]
GAUDI_no_config (from PROJECT) excludes [GAUDI_config]
GAUDI_root (from PROJECT) excludes [GAUDI_no_root]
GAUDI_cleanup (from PROJECT) excludes [GAUDI_no_cleanup]
GAUDI_prototypes (from PROJECT) excludes [GAUDI_no_prototypes]
GAUDI_with_installarea (from PROJECT) excludes [GAUDI_without_installarea]
GAUDI_without_version_directory (from PROJECT) excludes [GAUDI_with_version_directory]
LCGCMT_no_config (from PROJECT) excludes [LCGCMT_config]
LCGCMT_no_root (from PROJECT) excludes [LCGCMT_root]
LCGCMT_cleanup (from PROJECT) excludes [LCGCMT_no_cleanup]
LCGCMT_prototypes (from PROJECT) excludes [LCGCMT_no_prototypes]
LCGCMT_without_installarea (from PROJECT) excludes [LCGCMT_with_installarea]
LCGCMT_with_version_directory (from PROJECT) excludes [LCGCMT_without_version_directory]
x86_64 (from package CMT) package LCG_Settings implies [host-x86_64]
slc55 (from package CMT) package LCG_Settings implies [host-slc5]
gcc432 (from package CMT) package LCG_Settings implies [gcc43 host-gcc43]
Unix (from package CMT) package LCG_Settings implies [host-unix] package LCG_Settings excludes [WIN32 Win32]
gcc43 (from package LCG_SettingsCompat)
amd64 (from package LCG_SettingsCompat)
slc5 (from package LCG_SettingsCompat)
slc5-amd64 (from package LCG_SettingsCompat) package LCG_SettingsCompat implies [slc5 amd64]
optimized (from package LCG_SettingsCompat) package BesPolicy implies [opt]
target-unix (from package LCG_Settings)
host-x86_64 (from package LCG_Settings)
host-gcc4 (from package LCG_Settings) package LCG_Settings implies [host-gcc]
host-gcc43 (from package LCG_Settings) package LCG_Settings implies [host-gcc4]
host-gcc (from package LCG_Settings)
host-linux (from package LCG_Settings)
host-unix (from package LCG_Settings)
host-slc5 (from package LCG_Settings) package LCG_Settings implies [host-slc]
host-slc (from package LCG_Settings)
target-linux (from package LCG_Settings) package LCG_Settings implies [target-unix]
target-slc5 (from package LCG_Settings) package LCG_Settings implies [target-slc]
target-opt (from package LCG_Settings)
target-gcc43 (from package LCG_Settings) package LCG_Settings implies [target-gcc4]
target-x86_64 (from package LCG_Settings)
target-slc (from package LCG_Settings)
target-gcc4 (from package LCG_Settings) package LCG_Settings implies [target-gcc]
target-gcc (from package LCG_Settings)
ROOT_GE_5_15 (from package LCG_Configuration)
ROOT_GE_5_19 (from package LCG_Configuration)
opt (from package BesCxxPolicy) package BesPolicy implies [optimized]
HasAthenaRunTime (from package BesPolicy)
ROOTBasicLibs (from package BesROOT)
----------> CMTPATH
# Add path /afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2 from initialization
# Add path /afs/ihep.ac.cn/bes3/offline/Boss/6.6.4.p01 from initialization
# Add path /afs/ihep.ac.cn/bes3/offline/ExternalLib/Gaudi/GAUDI_v21r6/x86_64-slc5-gcc43-clhep2.0.4.5 from initialization
# Add path /afs/ihep.ac.cn/bes3/offline/ExternalLib/lcg/app/releases/LCGCMT/LCGCMT_57a_clhep2.0.4.5 from initialization
