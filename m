From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 21 Mar 2017 02:10:02 +0000
Subject: [PATCH 1/4 V2] staging: atomisp: remove else statement after return
Message-Id: <20170321021002.GA1115@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, daeseok.youn@gmail.com, alan@linux.intel.com, singhalsimran0@gmail.com, dan.carpenter@oracle.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It doesn't need to have else statement after return.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: one(2/4) of this series was updated so I tried to send them again.

 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index d97a8df..8bdb224 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -2958,11 +2958,11 @@ int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
 		dev_err(isp->dev, "copy to user failed: copied %d bytes\n",
 			ret);
 		return -EFAULT;
-	} else {
-		list_del_init(&md_buf->list);
-		list_add_tail(&md_buf->list, &asd->metadata[md_type]);
 	}
 
+	list_del_init(&md_buf->list);
+	list_add_tail(&md_buf->list, &asd->metadata[md_type]);
+
 	dev_dbg(isp->dev, "%s: HAL de-queued metadata type %d with exp_id %d\n",
 		__func__, md_type, md->exp_id);
 	return 0;
-- 
1.9.1

