From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 24 May 2004 18:44:08 +0000
Subject: Re: [Kernel-janitors] [PATCH] request_region() on
Message-Id: <20040524184408.GA7673@lorien.prodam>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10620776686022282=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40AFCC31.3050206@acm.org>
In-Reply-To: <40AFCC31.3050206@acm.org>
To: kernel-janitors@vger.kernel.org

--===============10620776686022282==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


 Hello Gustavo,

Em Sat, May 22, 2004 at 06:54:57PM -0300, Gustavo Franco escreveu:

| I've added two error checks for request_region() calls on the source
| and replaced a check_region() with request_region().The release_region()
| calls seems to be ok, but let me known if i'm missing something.
| 
| Comments?

 Just remember OSS is depecrated, and will be removed from the kernel.

 It is good to do that work to learn something, but is not so useful.

PS: Well, it removes warnings too. Is also good thing.

-- 
Luiz Fernando N. Capitulino
<http://www.telecentros.sp.gov.br>

--===============10620776686022282==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10620776686022282==--
