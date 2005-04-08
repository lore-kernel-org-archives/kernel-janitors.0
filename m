From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 08 Apr 2005 09:33:44 +0000
Subject: [KJ] Re: [PATCH] arch/ppc64: Replace custom MIN macro
Message-Id: <20050408093344.GA834@neon>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============063372754403771436=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <16981.48000.586005.656966@cargo.ozlabs.ibm.com>
In-Reply-To: <16981.48000.586005.656966@cargo.ozlabs.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============063372754403771436==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2005 at 09:00:16AM +1000, Paul Mackerras wrote:
> Tobias Klauser writes:
> 
> > >From the kerneljanitors TODO list:
> > - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.
> 
> Well... OK, that removes 4 lines of code, which is good, but the
> explanation needs changing - it's not a question of safety, it doesn't
> matter if we evaluate sizeof() more than once. :)

min/max from kernel.h also do type checking, so the compiler throws out
warnings in case of mismatching types, although this doesn't matter for
this patch.

So how about the following description:

Replace a custom MIN() macro with the min() macro from kernel.h
This patch removes 4 lines of redundant code.

	Tobias

--===============063372754403771436==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============063372754403771436==--
