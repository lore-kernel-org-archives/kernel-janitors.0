From: Patrick Mochel <mochel@digitalimplant.org>
Date: Thu, 21 Jul 2005 21:08:06 +0000
Subject: [KJ] Re: [PATCH] Driver core: Documentation: use snprintf and
Message-Id: <Pine.LNX.4.50.0507211402380.24901-100000@monsoon.he.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83121570252496335=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83121570252496335==
Content-Type: TEXT/PLAIN; charset=US-ASCII




On Thu, 21 Jul 2005, Jan Veldeman wrote:

>
> Documentation should give the good example of using snprintf and
> strnlen in stead of sprintf and strlen.

Thanks. However, for future refernce you should put a space between the
parameters in a function call. It's easy enough to fix up in this patch.


	Pat

--===============83121570252496335==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83121570252496335==--
