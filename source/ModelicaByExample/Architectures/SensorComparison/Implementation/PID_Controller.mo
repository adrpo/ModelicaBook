within ModelicaByExample.Architectures.SensorComparison.Implementation;
model PID_Controller "Controller subsystem implemented using a PID controller"
  extends Interfaces.Controller;
  Modelica.Blocks.Continuous.LimPID PID(
    k=k,
    Ti=Ti,
    Td=Td,
    yMax=yMax) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,0})));
  parameter Real k "Gain of controller";
  parameter Modelica.SIunits.Time Ti "Time constant of Integrator block";
  parameter Modelica.SIunits.Time Td "Time constant of Derivative block";
  parameter Real yMax "Upper limit of output";
equation
  connect(setpoint, PID.u_s) annotation (Line(
      points={{0,120},{0,60},{40,60},{40,0},{12,0}},
      color={0,0,127},
      pattern=LinePattern.None,
      smooth=Smooth.None));
  connect(measured, PID.u_m) annotation (Line(
      points={{100,0},{60,0},{60,-40},{0,-40},{0,-12}},
      color={0,0,127},
      pattern=LinePattern.None,
      smooth=Smooth.None));
  connect(PID.y, command) annotation (Line(
      points={{-11,0},{-110,0}},
      color={0,0,127},
      pattern=LinePattern.None,
      smooth=Smooth.None));
  annotation (Diagram(graphics));
end PID_Controller;