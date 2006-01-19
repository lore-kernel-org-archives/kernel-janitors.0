From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Thu, 19 Jan 2006 20:10:29 +0000
Subject: [KJ] [PATCH 2/5] README: Remove a.out reference
Message-Id: <a01a16b50601191210g7bb0b4d6uca221f09b33b4a6a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

From: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

Removed a line promising that users still could run a.out user programs.
As far as I know all distributions have removed libc.4 support years
ago, so while the kernel itself still might support a.out, the promise
is both 1) not needed anymore and 2) most likely not correct.

Signed-off-by: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

---

--- linux-2.6.15.1/README.ldp   2006-01-19 14:13:11.000000000 +0100
+++ linux-2.6.15.1/README       2006-01-19 14:13:28.000000000 +0100
@@ -189,8 +189,6 @@
    Also remember to upgrade your binutils package (for as/ld/nm and compan=
y)
    if necessary. For more information, refer to Documentation/Changes.

-   Please note that you can still run a.out user programs with this kernel.
-
  - Do a "make" to create a compressed kernel image. It is also
    possible to do "make install" if you have lilo installed to suit the
    kernel makefiles, but you may want to check your particular lilo
setup first.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
