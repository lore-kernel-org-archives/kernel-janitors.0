From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:39 +0000
Subject: [PATCH 06/12] [S390] dasd: drop unneeded newline
Message-Id: <1514386305-7402-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Haberland <sth@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Jan Hoeppner <hoeppner@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org

DBF_DEV_EVENT prints a newline at the end of the message string,
so the message string does not need to include a newline explicitly.
Done using Coccinelle.

The two strings are also concatenated into one for easier grepping.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/s390/block/dasd_diag.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/s390/block/dasd_diag.c b/drivers/s390/block/dasd_diag.c
index f035c2f..96c507a 100644
--- a/drivers/s390/block/dasd_diag.c
+++ b/drivers/s390/block/dasd_diag.c
@@ -329,8 +329,7 @@ static void dasd_ext_handler(struct ext_code ext_code,
 		private = kzalloc(sizeof(*private), GFP_KERNEL);
 		if (private = NULL) {
 			DBF_DEV_EVENT(DBF_WARNING, device, "%s",
-				"Allocating memory for private DASD data "
-				      "failed\n");
+				"Allocating memory for private DASD data failed");
 			return -ENOMEM;
 		}
 		ccw_device_get_id(device->cdev, &private->dev_id);

