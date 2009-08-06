From: Julia Lawall <julia@diku.dk>
Date: Thu, 06 Aug 2009 20:06:03 +0000
Subject: [PATCH 3/3] drivers/scsi: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0908062205190.19100@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Check that the result of kmalloc is not NULL before passing it to other
functions.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x = NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/sr.c                   |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index cce0fe4..3fbf42e 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -211,6 +211,8 @@ static int sr_media_change(struct cdrom_device_info *cdi, int slot)
 	}
 
 	sshdr =  kzalloc(sizeof(*sshdr), GFP_KERNEL);
+	if (!sshdr)
+		return -ENOMEM;
 	retval = sr_test_unit_ready(cd->device, sshdr);
 	if (retval || (scsi_sense_valid(sshdr) &&
 		       /* 0x3a is medium not present */
