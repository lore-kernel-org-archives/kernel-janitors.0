From: Paul Mackerras <paulus@samba.org>
Date: Thu, 07 Apr 2005 23:00:16 +0000
Subject: [KJ] Re: [PATCH] arch/ppc64: Replace custom MIN macro
Message-Id: <16981.48000.586005.656966@cargo.ozlabs.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37183205812771991=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37183205812771991==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Tobias Klauser writes:

> >From the kerneljanitors TODO list:
> - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.

Well... OK, that removes 4 lines of code, which is good, but the
explanation needs changing - it's not a question of safety, it doesn't
matter if we evaluate sizeof() more than once. :)

Paul.

--===============37183205812771991==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37183205812771991==--
