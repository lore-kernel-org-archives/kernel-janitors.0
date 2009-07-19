From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:27:20 +0000
Subject: [PATCH 6/10] drivers/scsi: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907191726590.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.  I have additionally added a return if the NULL tests
succeeds, because it is not clear that the rest of the function, which is
for debugging only, makes sense in this case.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i =3D E->fld;
+ T i;
  ... when !=3D E=E1
      when !=3D i
  if (E =3D NULL||...) S
+ i =3D E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/fd_mcs.c               |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/fd_mcs.c b/drivers/scsi/fd_mcs.c
index 85bd54c..eff35cf 100644
--- a/drivers/scsi/fd_mcs.c
+++ b/drivers/scsi/fd_mcs.c
@@ -1127,11 +1127,13 @@ static void fd_mcs_print_info(Scsi_Cmnd * SCpnt)
 	unsigned int imr;
 	unsigned int irr;
 	unsigned int isr;
-	struct Scsi_Host *shpnt =3D SCpnt->host;
+	struct Scsi_Host *shpnt;
=20
 	if (!SCpnt || !SCpnt->host) {
 		printk("fd_mcs: cannot provide detailed information\n");
+		return;
 	}
+	shpnt =3D SCpnt->host;
=20
 	printk("%s\n", fd_mcs_info(SCpnt->host));
 	print_banner(SCpnt->host);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
