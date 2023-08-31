s.boot;
s.quit;

s.meter;
s.scope;
s.freqscope;

{ SinOsc.ar(SinOsc.kr([0.01, 0.01]).exprange(2, 1e2), 0, 0.01) }.play

(
SynthDef(\misinte, {|frec=440, amp=0.5|
	var sen, env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([0,1,0],[0.1,0.1]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);


a=Synth(\misinte,[\frec, rrand(88,73)]);

{SinOsc.ar(55,0,0.01)!2}.play;
(
SynthDef("help-WhiteNoise", { arg out=0;
    Out.ar(out,
        WhiteNoise.ar(0.001)
    )
}).play;
)

{Pulse.ar(33,0.09,0.01,0)!2}.play;

Env.help;
Env.new([0,1,0.5,0.5,0],[0.1,0.1,0.1,0.5]).plot;


(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.9, 0.3,0.1], inf),
		\frec, Pseq([66, 66, 66],inf),
		\amp, 0.03
	)
);
)

~sec1.play;
~sec1.stop;

(
~sec1=Pdef(\sec2,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.02, 0.08,0.02], inf),
		\frec, Pseq([55, 55, 5],inf),
		\amp, 0.009
	)
);
)

~sec1.play;
~sec1.stop;