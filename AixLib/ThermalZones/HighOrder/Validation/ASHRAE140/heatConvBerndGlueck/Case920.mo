within AixLib.ThermalZones.HighOrder.Validation.ASHRAE140.heatConvBerndGlueck;
model Case920
  extends heatConvBerndGlueck.Case620(
                  Room(wallTypes(OW=AixLib.DataBase.Walls.ASHRAE140.OW_Case900(),
          groundPlate_upp_half=AixLib.DataBase.Walls.ASHRAE140.FL_Case900())));
  annotation (Documentation(info="<html>
<p>As described in ASHRAE Standard 140.</p>
<p>Difference to case 900: </p>
<ul>
<li>no windows on south side. two windows, one facing east, one facing west, each with a surface of 6m2.</li>
</ul>
</html>", revisions="<html>
 <ul>
 <li><i>March 9, 2015</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>"));
end Case920;