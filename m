From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Thu, 19 Jan 2006 20:12:21 +0000
Subject: [KJ] [PATCH 3/5] README: s/new/newer/ bzip2 format
Message-Id: <a01a16b50601191212n3570e5b8w7b27ef556231ee4e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

From: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

bzip2 is not new any more, so replace "new" with "newer".

Signed-off-by: H=E5kon L=F8vdal <Hakon.Lovdal@ericsson.com>

---

--- linux-2.6.15.1/README.a.out 2006-01-19 14:19:08.000000000 +0100
+++ linux-2.6.15.1/README       2006-01-19 14:19:31.000000000 +0100
@@ -66,7 +66,7 @@
    whatever the kernel-du-jour happens to be.

  - You can also upgrade between 2.6.xx releases by patching.  Patches are
-   distributed in the traditional gzip and the new bzip2 format.  To
+   distributed in the traditional gzip and the newer bzip2 format.  To
    install by patching, get all the newer patch files, enter the
    top level directory of the kernel source (linux-2.6.xx) and execute:

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
