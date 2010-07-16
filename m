From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:14:49 +0000
Subject: [PATCH 08/15] staging: tm6000: fix null dereference and memory leak
Message-Id: <1279296889-25063-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Stefan Ringel <stefan.ringel@arcor.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Do not dereference ir_input_dev if it is NULL.

Also free ir_input_dev->input_dev on error path.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/tm6000/tm6000-input.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/tm6000/tm6000-input.c b/drivers/staging/tm6000/tm6000-input.c
index 32f7a0a..5edf728 100644
--- a/drivers/staging/tm6000/tm6000-input.c
+++ b/drivers/staging/tm6000/tm6000-input.c
@@ -247,8 +247,10 @@ int tm6000_ir_init(struct tm6000_core *dev)
 
 	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
 	ir_input_dev = kzalloc(sizeof(*ir_input_dev), GFP_KERNEL);
+	if (!ir || !ir_input_dev)
+		goto err_out_free;
 	ir_input_dev->input_dev = input_allocate_device();
-	if (!ir || !ir_input_dev || !ir_input_dev->input_dev)
+	if (!ir_input_dev->input_dev)
 		goto err_out_free;
 
 	/* record handles to ourself */
@@ -330,6 +332,8 @@ int tm6000_ir_init(struct tm6000_core *dev)
 err_out_stop:
 	dev->ir = NULL;
 err_out_free:
+	if (ir_input_dev)
+		input_free_device(ir_input_dev->input_dev);
 	kfree(ir_input_dev);
 	kfree(ir);
 	return err;
-- 
1.7.0.4

