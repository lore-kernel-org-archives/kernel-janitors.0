From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 14 Apr 2004 21:33:25 +0000
Subject: Re: [Kernel-janitors] [PATHC] fix ide.c warning
Message-Id: <20040414183325.51489eb4.lcapitulino@prefeitura.sp.gov.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33196429679070644=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200404140217.i3E2Hrgn023951@p-chan.krl.com>
In-Reply-To: <200404140217.i3E2Hrgn023951@p-chan.krl.com>
To: kernel-janitors@vger.kernel.org

--===============33196429679070644==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


 Hi Michael,

Em Thu, 15 Apr 2004 07:10:02 +1000
Michael Still <mikal@stillhq.com> escreveu:

| > | This fixes the "implicit declaration of function `pnpide_init'" warning
| > | in ide.c.  Based on 2.6.5-mm5.
| > | 
| > | ===== drivers/ide/ide.c 1.132 vs edited =====
| > | --- 1.132/drivers/ide/ide.c	Sat Apr 10 18:22:11 2004
| > | +++ edited/drivers/ide/ide.c	Tue Apr 13 20:59:52 2004
| > | @@ -2245,7 +2245,10 @@
| > |  		return 1;
| > |  	}
| > |  #if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP) && defined(MODULE)
| > | -	pnpide_init(0);
| > | +	{
| > | +		extern void pnpide_init(int enable);
| > | +		pnpide_init(0);
| > | +	}
| > |  #endif /* CONFIG_BLK_DEV_IDEPNP */
| > |  #ifdef CONFIG_PROC_FS
| > |  	ide_remove_proc_entries(drive->proc, DRIVER(drive)->proc);
| > 
| >  what about to declare pnpide_init() in include/linux/ide.h (like ide_end_request),
| > and just call it ? It is a bad idea ?
| 
| I would think it's much better form to either:
| 
|   - put the prototype in a header
|   - repeat the prototype at the top of this file (there are risks here)

 I don't think is a good way to create a new .h file only to put
one prototype there. include/linux/ide.h already does that for another ide
functions, so it can be used (well, was what a quick look show me).

| With the first one being much prefered in my book. It's just not 
| idiomatic in C to do it this way. You also don't need the extern:
| 
|       void pnpide_init(int enable);
| 
| should be sufficient.

 IMHO, the extern declaration makes it easy to understand.

| Additionally, putting that block of code in braces is evil.

 Yes, is what I'm trying to avoid (but I already added evil code
in the kernel :-)).


-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

--===============33196429679070644==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33196429679070644==--
