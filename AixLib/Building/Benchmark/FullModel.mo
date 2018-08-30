within AixLib.Building.Benchmark;
model FullModel
  replaceable package Medium_Air =
    AixLib.Media.Air "Medium in the component";
  Weather weather
    annotation (Placement(transformation(extent={{50,82},{70,102}})));
  Buildings.Office office
    annotation (Placement(transformation(extent={{30,0},{92,60}})));
  Generation.Generation generation(
    m_flow_nominal_hotwater=6.307,
    m_flow_nominal_warmwater=7.819,
    m_flow_nominal_coldwater=7.774,
    m_flow_nominal_generation_hot=3.805,
    vol_small=0.012,
    vol_big=0.024,
    m_flow_nominal_generation_warmwater=4.951,
    m_flow_nominal_generation_coldwater=3.914,
    m_flow_nominal_generation_aircooler=4.951,
    Probe_depth=120,
    n_probes=1,
    pipe_length_hotwater=25,
    pipe_length_warmwater=25,
    pipe_length_coldwater=25,
    alphaHC1_warm=500,
    alphaHC2_warm=500,
    alphaHC1_cold=500,
    R_loss_small=50,
    R_loss_big=100,
    m_flow_nominal_generation_air_max=28.649,
    m_flow_nominal_generation_air_min=22.537,
    pipe_diameter_hotwater=0.0809,
    pipe_diameter_warmwater=0.0809,
    pipe_diameter_coldwater=0.0689,
    dpHeatexchanger_nominal=20000,
    pipe_nodes=2,
    dpValve_nominal_generation_hot=40000,
    T_conMax_big=328.15,
    T_conMax_small=328.15,
    dpValve_nominal_warmwater=37000,
    dpValve_nominal_coldwater=40000,
    dpValve_nominal_generation_aircooler=60000,
    Earthtemperature_start=283.15)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

  Transfer.Transfer_TBA.Full_Transfer_TBA full_Transfer_TBA(
    m_flow_nominal_openplanoffice=2.516,
    m_flow_nominal_conferenceroom=0.19,
    m_flow_nominal_multipersonoffice=0.378,
    m_flow_nominal_canteen=1.061,
    m_flow_nominal_workshop=1.061,
    dp_Valve_nominal_openplanoffice=10000,
    dp_Valve_nominal_conferenceroom=10000,
    dp_Valve_nominal_multipersonoffice=10000,
    dp_Valve_nominal_canteen=10000,
    dp_Valve_nominal_workshop=10000)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));

  Transfer.Transfer_RLT.Full_Transfer_RLT full_Transfer_RLT
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  InternalLoads.InternalLoads internalLoads
    annotation (Placement(transformation(extent={{-48,50},{-8,10}})));
  Fluid.HeatExchangers.ConstantEffectiveness Ext_Warm(
    redeclare package Medium2 = Medium_Air,
    redeclare package Medium1 = Medium_Air,
    dp1_nominal=1,
    dp2_nominal=1,
    m1_flow_nominal=3.375,
    m2_flow_nominal=3.375)
    annotation (Placement(transformation(extent={{-8,9},{8,-9}},
        rotation=90,
        origin={11,58})));
  BusSystem.Bus_measure measureBus
    annotation (Placement(transformation(extent={{-120,0},{-80,40}})));
  BusSystem.Bus_Control controlBus
    annotation (Placement(transformation(extent={{-120,-40},{-80,0}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Evaluation.Evaluation evaluation
    annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
  Fluid.Sensors.Temperature senTem2(redeclare package Medium = Medium_Air)
    annotation (Placement(transformation(extent={{-34,52},{-22,64}})));
  Fluid.Sensors.Temperature senTem1(redeclare package Medium = Medium_Air)
    annotation (Placement(transformation(extent={{62,64},{74,76}})));
equation
  connect(generation.Fluid_out_hot, full_Transfer_RLT.Fluid_in_hot) annotation (
     Line(points={{-60,-42},{-6,-42},{-6,-42},{0,-42}}, color={0,127,255}));
  connect(generation.Fluid_in_hot, full_Transfer_RLT.Fluid_out_hot) annotation (
     Line(points={{-60,-46},{-8,-46},{-8,-46},{0,-46}}, color={0,127,255}));
  connect(generation.Fluid_in_hot, generation.Fluid_out_warm)
    annotation (Line(points={{-60,-46},{-60,-48}}, color={0,127,255}));
  connect(generation.Fluid_out_warm, full_Transfer_TBA.Fluid_in_warm)
    annotation (Line(points={{-60,-48},{-40,-48},{-40,-80},{40,-80},{40,-47.4},
          {60,-47.4}}, color={0,127,255}));
  connect(full_Transfer_TBA.Fluid_out_warm, generation.Fluid_in_warm)
    annotation (Line(points={{60,-51.4},{40,-51.4},{40,-80},{-40,-80},{-40,-52},
          {-60,-52}}, color={0,127,255}));
  connect(office.Air_in, full_Transfer_RLT.Air_out) annotation (Line(points={{48.6,0},
          {48.6,-20},{14,-20},{14,-40}},         color={0,127,255}));
  connect(weather.Air_out, Ext_Warm.port_a2)
    annotation (Line(points={{50,90},{5.6,90},{5.6,66}},
                                                     color={0,127,255}));
  connect(Ext_Warm.port_b2, full_Transfer_RLT.Air_in)
    annotation (Line(points={{5.6,50},{6,50},{6,-40}},
                                              color={0,127,255}));
  connect(weather.Air_in, Ext_Warm.port_b1)
    annotation (Line(points={{50,86},{16.4,86},{16.4,66}},
                                                       color={0,127,255}));
  connect(Ext_Warm.port_a1, office.Air_out) annotation (Line(points={{16.4,50},
          {16,50},{16,-16},{36,-16},{36,-8},{36.2,-8},{36.2,0}},
                                             color={0,127,255}));
  connect(weather.measureBus, measureBus) annotation (Line(
      points={{60,82},{60,80},{-74,80},{-74,20},{-100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(generation.measureBus, measureBus) annotation (Line(
      points={{-74,-40},{-74,20},{-100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(office.measureBus, measureBus) annotation (Line(
      points={{30,30},{0,30},{0,80},{-74,80},{-74,20},{-100,20}},
      color={255,204,51},
      thickness=0.5));

  connect(full_Transfer_RLT.measureBus, measureBus) annotation (Line(
      points={{20.2,-53},{28,-53},{28,-36},{-74,-36},{-74,20},{-100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(full_Transfer_TBA.measureBus, measureBus) annotation (Line(
      points={{80,-54},{92,-54},{92,-36},{-74,-36},{-74,20},{-100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(full_Transfer_TBA.HeatPort_TBA, office.Heatport_TBA) annotation (Line(
        points={{74,-40},{74,-20},{79.6,-20},{79.6,0}}, color={191,0,0}));
  connect(internalLoads.AddPower, office.AddPower)
    annotation (Line(points={{-9.2,18},{30,18}}, color={191,0,0}));
  connect(internalLoads.internalBus, office.internalBus) annotation (Line(
      points={{-9.6,42},{30,42}},
      color={255,204,51},
      thickness=0.5));
  connect(weather.internalBus, office.internalBus) annotation (Line(
      points={{66,81.8},{66,81.8},{66,80},{0,80},{0,42},{30,42}},
      color={255,204,51},
      thickness=0.5));
  connect(generation.controlBus, controlBus) annotation (Line(
      points={{-66,-40},{-66,-20},{-100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(weather.controlBus, controlBus) annotation (Line(
      points={{54,82},{54,74},{-66,74},{-66,-20},{-100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(full_Transfer_RLT.controlBus, controlBus) annotation (Line(
      points={{20.2,-47.2},{24,-47.2},{24,-30},{-66,-30},{-66,-20},{-100,-20}},
      color={255,204,51},
      thickness=0.5));

  connect(full_Transfer_TBA.controlBus, controlBus) annotation (Line(
      points={{80,-46},{80,-46},{86,-46},{86,-30},{-66,-30},{-66,-20},{-100,-20}},
      color={255,204,51},
      thickness=0.5));

  connect(generation.Fluid_out_cold, full_Transfer_RLT.Fluid_in_cold)
    annotation (Line(points={{-60,-58},{-40,-58},{-40,-54},{0,-54}}, color={0,127,
          255}));
  connect(full_Transfer_RLT.Fluid_out_cold, generation.Fluid_in_cold)
    annotation (Line(points={{0,-58},{-40,-58},{-40,-54},{-60,-54}}, color={0,127,
          255}));
  connect(full_Transfer_TBA.Fluid_in_cold, generation.Fluid_out_cold)
    annotation (Line(points={{60,-54},{40,-54},{40,-74},{-40,-74},{-40,-58},{-60,
          -58}}, color={0,127,255}));
  connect(full_Transfer_TBA.Fluid_out_cold, generation.Fluid_in_cold)
    annotation (Line(points={{60,-58},{40,-58},{40,-80},{-40,-80},{-40,-54},{-60,
          -54}}, color={0,127,255}));
  connect(internalLoads.measureBus, office.measureBus) annotation (Line(
      points={{-9.6,30},{0,30},{0,30},{30,30}},
      color={255,204,51},
      thickness=0.5));
  connect(evaluation.measureBus, measureBus) annotation (Line(
      points={{-40,-6},{-74,-6},{-74,20},{-100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(weather.SolarRadiation_North5, office.SolarRadiationPort_North)
    annotation (Line(points={{71,99},{110,99},{110,54},{88.9,54}}, color={255,
          128,0}));
  connect(weather.SolarRadiation_East, office.SolarRadiationPort_East)
    annotation (Line(points={{71,95},{114,95},{114,42},{88.9,42}}, color={255,
          128,0}));
  connect(weather.SolarRadiation_South, office.SolarRadiationPort_South1)
    annotation (Line(points={{71,91},{118,91},{118,30},{88.9,30}}, color={255,
          128,0}));
  connect(weather.SolarRadiation_West, office.SolarRadiationPort_West1)
    annotation (Line(points={{71,87},{122,87},{122,88},{122,88},{122,18},{88.9,
          18},{88.9,18}}, color={255,128,0}));
  connect(weather.SolarRadiation_Hor, office.SolarRadiationPort_Hor1)
    annotation (Line(points={{71,83},{126,83},{126,6},{88.9,6}}, color={255,128,
          0}));
  connect(senTem2.port, full_Transfer_RLT.Air_in) annotation (Line(points={{-28,
          52},{-16,52},{-16,52},{-2,52},{-2,46},{6,46},{6,-40}}, color={0,127,
          255}));
  connect(senTem1.port, office.Air_out) annotation (Line(points={{68,64},{68,62},
          {26,62},{26,46},{16,46},{16,-16},{36,-16},{36,-8},{36.2,-8},{36.2,0}},
        color={0,127,255}));
  connect(senTem1.T, measureBus.Air_out) annotation (Line(points={{72.2,70},{76,
          70},{76,80},{-74,80},{-74,20.1},{-99.9,20.1}}, color={0,0,127}));
  connect(senTem2.T, measureBus.Air_in) annotation (Line(points={{-23.8,58},{0,
          58},{0,80},{-74,80},{-74,20.1},{-99.9,20.1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=5000, Interval=1));
end FullModel;