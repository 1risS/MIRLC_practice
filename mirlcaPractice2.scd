// NX102
// 2012-08-07_23_05_45

// La ment no té límits.

// Use with Jitlib:
Server
FluidMLPClassifier

p = ProxySpace.push(s.boot);

// Read one sample on your collection:

b = Buffer.read(s,Platform.userHomeDir +/+ "nobounds" +/+ "samples/" +/+ "claus" +/+ "IronBucket1.wav",bufnum:1);

// Play and fun:

~nx102.play;
(
~nx102 = Ndef(\hola,{
	Pan2.ar(LeakDC.ar(Normalizer.ar(
				BPeakEQ.ar(BPeakEQ.ar(BPeakEQ.ar(BPeakEQ.ar(FreeVerb.ar(
					RHPF.ar(RLPF.ar(
					Pulse.ar(
						(PlayBuf.kr(1,1,Rand(50,100),1,0,1)*Rand(100,1000)).clip(
							Rand(5,12),Rand(12,20)))
						,Rand(10,5000),Rand(0.005,0.1))
			,Rand(5000,20000),Rand(0.05,SinOsc.kr(2).range(0,0.55)))
					,0.0,0.0,0.0)
		 ,100,6.0,6),1000,6.0,0),5000,6.0,0),10000,6.0,6)
		 ,(1.25/0.999)*1.0,0.1)),0)
});
)

~nx102 = nil;
b.free;




_________-



(
{
	x = SinOsc.ar(SinOsc.ar(0.0045).range([40,42], [1000, 950])) * GrainSin.ar(2, Impulse.ar(1), SinOsc.kr(0.003).range(0.001, 0.01), SinOsc.kr(0.002).range(1000, 4000), SinOsc.kr(0.3), -1, 512, 0.5);
	x = CombC.ar(x, 4, SinOsc.kr(0.1).range(0.1, 2), 10, 1, x);
	x = RLPF.ar(x, SinOsc.kr(0.022).abs * SinOsc.kr(0.01).range(400, 4000), 1);
	x = CombC.ar(x, 6, 6, 10, 1, x);
	x = SinOsc.ar(SinOsc.ar(0.0001).range(400, 4000)) * x;
	x = GVerb.ar(x);
	x = Compander.ar(x, x, 0.2, 1, 1/10)  * 0.5;
	x = x + LPF.ar(DelayC.ar(x, 2, SinOsc.ar(0.01).range(0.9, 1.1), SinOsc.ar(0.0001).range(0, 1), 0), 200);
	y = GVerb.ar(HPF.ar(SinOsc.ar(SinOsc.kr(0.1).range(200, 210)) * GrainSin.ar(2, Impulse.ar(1), 1, SinOsc.ar(1/8).range(80, 100), 0, -1, 512, 0.1) * SinOsc.ar(0.001), 400));
	z = WhiteNoise.ar(SinOsc.kr([0.1, 0.145]) * SinOsc.kr(0.34) * SinOsc.kr(1.13) * SinOsc.kr(0.712));
	z = RHPF.ar(z, SinOsc.kr(0.001).range(1000, 4000) * SinOsc.kr(0.0212).abs, 0.5);
	z = z + CombC.ar(z, 1, 0.1, 1);
	z = z + CombC.ar(z, 1, 1, 10);
	z = z * SinOsc.ar(0.0001) * 0.004;
	x+y+z;
}
)