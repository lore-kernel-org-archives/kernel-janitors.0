From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:25:46 +0000
Subject: [PATCH 29/42] drivers/scsi: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052225240.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?Q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>, Willem Riede <osst@riede.org>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Outdent the code following the if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This patch doesn't change the semantics of the code.  But it might not be
what is intended.

 drivers/scsi/st.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index 24211d0..9c57a50 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -4166,9 +4166,9 @@ out_free_tape:
 			if (STm->cdevs[j]) {
 				if (cdev = STm->cdevs[j])
 					cdev = NULL;
-					device_destroy(st_sysfs_class,
-						       MKDEV(SCSI_TAPE_MAJOR,
-							     TAPE_MINOR(i, mode, j)));
+				device_destroy(st_sysfs_class,
+					       MKDEV(SCSI_TAPE_MAJOR,
+						     TAPE_MINOR(i, mode, j)));
 				cdev_del(STm->cdevs[j]);
 			}
 		}
