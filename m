From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Date: Sat, 10 Jul 2004 13:55:29 +0000
Subject: Re: [Kernel-janitors] [patch] MIN/MAX in ide-timing.h
Message-Id: <20040710105529.22e81954.lcapitulino@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============003763475892930801=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040708181843.GA1370@moley.homelinux.net>
In-Reply-To: <20040708181843.GA1370@moley.homelinux.net>
To: Clemens Buchacher <drizzd@aon.at>
Cc: vojtech@suse.cz, linux-ide@vger.kernel.org, kernel-janitors@lists.osdl.org, lcapitulino@prefeitura.sp.gov.br

--===============003763475892930801==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


 Hello Clemens,

 The patch seems right to me, but I have some comments:

Em Thu, 8 Jul 2004 20:18:43 +0200
Clemens Buchacher <drizzd@aon.at> screveu:

| # This is a BitKeeper generated diff -Nru style patch.

[...]

 
| -#define MIN(a,b)	        ((a)<(b)?(a):(b))
| -#define MAX(a,b)	        ((a)>(b)?(a):(b))
| -#define FIT(v,min,max)	MAX(MIN(v,max),min)
| -#define ENOUGH(v,unit)	(((v)-1)/(unit)+1)
| -#define EZ(v,unit)	        ((v)?ENOUGH(v,unit):0)
| +#define FIT(v,vmin,vmax)	max(min(v,vmax),vmin)
| +#define ENOUGH(v,unit)	(((v)-1)/(unit)+1)
| +#define EZ(v,unit)		((v)?ENOUGH(v,unit):0)

 Did you changed something in ENOUGH and EZ ?

 Maybe we can try to make it inlined functions, thus maybe is possible to
solve the warning problem.

PS: Try to send your patches in the body of the e-mail.

-- 
Luiz Fernando

--===============003763475892930801==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============003763475892930801==--
