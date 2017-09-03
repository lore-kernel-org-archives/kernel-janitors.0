From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Sep 2017 20:32:03 +0000
Subject: [PATCH 2/7] [media] saa7164: Improve a size determination in two functions
Message-Id: <76397eaa-9c30-af07-e7be-cecee2a9abc6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
In-Reply-To: <170abf7f-3b62-a37c-966a-8b574acae230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Sep 2017 17:53:05 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/saa7164/saa7164-buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-buffer.c b/drivers/media/pci/saa7164/saa7164-buffer.c
index 6bd665ea190d..c83b2e914dcb 100644
--- a/drivers/media/pci/saa7164/saa7164-buffer.c
+++ b/drivers/media/pci/saa7164/saa7164-buffer.c
@@ -98,5 +98,5 @@ struct saa7164_buffer *saa7164_buffer_alloc(struct saa7164_port *port,
 		goto ret;
 	}
 
-	buf = kzalloc(sizeof(struct saa7164_buffer), GFP_KERNEL);
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
@@ -281,5 +281,5 @@ struct saa7164_user_buffer *saa7164_buffer_alloc_user(struct saa7164_dev *dev,
 {
 	struct saa7164_user_buffer *buf;
 
-	buf = kzalloc(sizeof(struct saa7164_user_buffer), GFP_KERNEL);
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
-- 
2.14.1

