within AixLib.DataBase.ThermalZones.OfficePassiveHouse;
record OPH_1_OfficeNoHeaterCooler "Office zone of office building without ideal heater cooler"
  final parameter Real eps = Modelica.Constants.eps;
  final parameter Real inf = Modelica.Constants.inf;
  final parameter Integer smallInt = 1;
  final parameter Integer bigInt = 99;

  extends AixLib.DataBase.ThermalZones.ZoneBaseRecord(
    T_start=eps,
    VAir=inf,
    AZone=inf,
    hRad=eps,
    lat=eps,
    nOrientations=bigInt,
    AWin=fill(eps, nOrientations),
    ATransparent=fill(eps, nOrientations),
    hConWin=eps,
    RWin=inf,
    gWin=eps,
    UWin=eps,
    ratioWinConRad=eps,
    AExt=fill(inf, nOrientations),
    hConExt=eps,
    nExt=smallInt,
    RExt=fill(inf, nExt),
    RExtRem=inf,
    CExt=fill(inf, nExt),
    AInt=inf,
    hConInt=eps,
    nInt=smallInt,
    RInt=fill(inf, nExt),
    CInt=fill(inf, nExt),
    AFloor=inf,
    hConFloor=eps,
    nFloor=1,
    RFloor=fill(inf, nFloor),
    RFloorRem=inf,
    CFloor=fill(inf, nFloor),
    ARoof=inf,
    hConRoof=eps,
    nRoof=smallInt,
    RRoof=fill(inf, nRoof),
    RRoofRem=inf,
    CRoof=fill(inf, nRoof),
    nOrientationsRoof=smallInt,
    tiltRoof=fill(eps, nOrientationsRoof),
    aziRoof=fill(eps, nOrientationsRoof),
    wfRoof=fill(eps/nOrientationsRoof, nOrientationsRoof),
    aRoof=eps,
    aExt=eps,
    TSoil=eps,
    hConWallOut=20.0,
    hRadWall=5,
    hConWinOut=20.0,
    hConRoofOut=20,
    hRadRoof=5,
    tiltExtWalls=fill(eps, nOrientations),
    aziExtWalls=fill(eps, nOrientations),
    wfWall=fill(smallInt/nOrientations, nOrientations),
    wfWin=fill(smallInt/nOrientations, nOrientations),
    wfGro=0.1,
    specificPeople=1/14,
    activityDegree=1.2,
    fixedHeatFlowRatePersons=70,
    ratioConvectiveHeatPeople=0.5,
    internalGainsMoistureNoPeople=0.5,
    internalGainsMachinesSpecific=7.0,
    ratioConvectiveHeatMachines=0.6,
    lightingPowerSpecific=12.5,
    ratioConvectiveHeatLighting=0.6,
    useConstantACHrate=false,
    baseACH=0.2,
    maxUserACH=1,
    maxOverheatingACH={3.0,2.0},
    maxSummerACH={1.0,273.15 + 10,273.15 + 17},
    winterReduction={0.2,273.15,273.15 + 10},
    withAHU=true,
    minAHU=0,
    maxAHU=12,
    hHeat=167500,
    lHeat=0,
    KRHeat=1000,
    TNHeat=1,
    HeaterOn=false,
    hCool=0,
    lCool=-1,
    KRCool=1000,
    TNCool=1,
    CoolerOn=false,
    TThresholdHeater=273.15 + 15,
    TThresholdCooler=273.15 + 22,
    withIdealThresholds=false);
  annotation (Documentation(revisions="<html>
 <ul>
  <li>
  November 27, 2019, by David Jansen:<br/>
  Integrate threshold for heater and cooler.
  </li>
  <li>
  February 28, 2019, by Niklas Huelsenbeck, dja, mre:<br/>
  Adapting nrPeople and nrPeopleMachines to area specific approach 
  </li>
  <li>
  September 27, 2016, by Moritz Lauster:<br/>
  Reimplementation.
  </li>
  <li>
  June, 2015, by Moritz Lauster:<br/>
  Implemented.
  </li>
 </ul>
 </html>", info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">Zone &quot;Office&quot; of an example building according to an office building with passive house standard. The building is divided in six zones, this is a typical zoning for an office building. </span></p>
</html>"));
end OPH_1_OfficeNoHeaterCooler;
