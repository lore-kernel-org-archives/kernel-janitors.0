From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Date: Sun, 11 Jul 2004 13:09:27 +0000
Subject: [Kernel-janitors] Re: [patch] MIN/MAX in ide-timing.h
Message-Id: <20040711100927.3a9e628d.lcapitulino@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17639446034723649=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040708181843.GA1370@moley.homelinux.net>
	<20040710105529.22e81954.lcapitulino@terra.com.br>
	<20040711091249.GG1991@moley.homelinux.net>
In-Reply-To: <20040711091249.GG1991@moley.homelinux.net>
To: Clemens Buchacher <drizzd@aon.at>
Cc: vojtech@suse.cz, linux-ide@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============17639446034723649==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 11 Jul 2004 11:12:50 +0200
Clemens Buchacher <drizzd@aon.at> screveu:

| On Sat, Jul 10, 2004 at 10:55:29AM -0300, Luiz Fernando N. Capitulino wrote:
| > | -#define MIN(a,b)	        ((a)<(b)?(a):(b))
| > | -#define MAX(a,b)	        ((a)>(b)?(a):(b))
| > | -#define FIT(v,min,max)	MAX(MIN(v,max),min)
| > | -#define ENOUGH(v,unit)	(((v)-1)/(unit)+1)
| > | -#define EZ(v,unit)	        ((v)?ENOUGH(v,unit):0)
| > | +#define FIT(v,vmin,vmax)	max(min(v,vmax),vmin)
| > | +#define ENOUGH(v,unit)	(((v)-1)/(unit)+1)
| > | +#define EZ(v,unit)		((v)?ENOUGH(v,unit):0)
| > 
| >  Did you changed something in ENOUGH and EZ ?
| 
| Yes, I added an additional tab to line up with the FIT definition.
| 
| >  Maybe we can try to make it inlined functions, thus maybe is possible to
| > solve the warning problem.
| 
| That's fine too.


 I just read the Vojtech's sugestion after I send this e-mail, I think
he's tip is very better (more simple, less changes).

 Sorry for that.

-- 
Luiz Fernando

--===============17639446034723649==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17639446034723649==--
