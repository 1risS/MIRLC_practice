Freesound.authType = "token";
Freesound.token="fv54l2ozlLIqIeslSuVSISKWuDwWy4D391Qr4lY5";

(
FSSound.textSearch( query: "bird", filter: "type:wav",params:('page':2), action:{|p|
    ~snd = p[2]; // first result
    ~snd.name.postln;
});
)


~samplesDir = Platform.userHomeDir +/+ "mircl" +/+ "samples/";

(
~preview = ~snd.retrievePreview(~samplesDir, {
        ~buf = Buffer.read(s, ~samplesDir +/+ ~snd.previewFilename);
        "done!".postln;
});

~samplesDir +/+ ~snd.previewFilename.postln;
)

~buf.play;
~buf.bufnum

Ndef(\playBuf, {PlayBuf.ar(1,~buf)}).play

a = MIRLCRep.new(path: ~samplesDir);

(
Ndef(\post, {
	var sig = In.ar(100,2);
	sig = LPF.ar(sig);
	Out.ar(0,sig)
}).play
)

a.play


MIRLCa

