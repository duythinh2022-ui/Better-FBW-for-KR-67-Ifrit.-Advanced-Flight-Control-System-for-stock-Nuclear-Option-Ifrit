# Better-FBW-for-KR-67-Ifrit.-Advanced-Flight-Control-System-for-stock-Nuclear-Option-Ifrit.
Flight Controls overhaul for Ifrit with a modern FBW system, for carefree handling even for PSM, damaged airframe departure tolerance, asymmetric weapons load compensation.

AI disclosure: Coding for this mod is entirely using AI, since idk how to write code lol, mainly Claude Opus 5/5.5 (feel free to call this AI slop if you like 🙂). Feel free to make modifications or new mods based on this mod
*NOTE: this mod is my side fun project and WIP, issues and problems are expected.

The core of the FCS is ported from my F-22E FCS mod (https://github.com/duythinh2022-ui/Advanced-flight-controls-addon-for-Aryx-s-F-22E-mod-for-Nuclear-Option.). So it has all of the same control laws, roll/yaw blending at high AoA, G-command at high airspeed blending to pitch rate command at low airspeed. Envelope protection, asymmetric weight compensation, fuel sloshing to compensate for shifted center of mass, and departure tolerance for damaged airframe.

The port was relatively easy, since the architecture is using INDI (Incremental Non-linear Dynamic inversion) with a control-surfaces and effector allocation solver on top. So the FCS just need the aerodynamic with moment models of the control-surfaces and the TVC to figure out which control-surfaces to move and how to move them, avoiding dependent on precomputed gain tables (which is classical Gain Scheduling). Since INDI works on the different, it compares the differences in angular acceleration based on the online model of the airframe with what is the pilot stick/pedal are asking for, then it compensate by adding more or less deflection to get to the desired angular acceleration. So the FCS does not need a perfectly accurate online model of the airframe to work well. (even tho it is easy to get that for every aircraft in the game). So the FCS is very tolerant against changes like battle damage, missing or damaged control-surfaces, engine damage, asymmetric weapon stores with barely any precomputed scheduling for those cases, the FCS will compensate and limit control authority if the airframe does not have the authority to compensate for something it cannot. 

That gave me an idea that I'll might do in the future. Making a tool that generates FCS to any fixed wings aircraft or at least most of them, by automatically using the lift curve and airfoil data from the airframe. Then running a series of offline static 6-Dof to get the force moment of the effectors and give the FCS a rough estimate for envelope limit especially AoA limit. Of course the generated FCS would be a base line, it will need fixes hand tuning.

  


