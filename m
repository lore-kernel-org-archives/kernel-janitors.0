From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:47:07 +0000
Subject: [patch] IR: ir-raw-event: null pointer dereference
Message-Id: <20100812074707.GJ645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code dereferenced ir->raw after freeing it and setting it
to NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/IR/ir-raw-event.c b/drivers/media/IR/ir-raw-event.c
index 43094e7..8e0e1b1 100644
--- a/drivers/media/IR/ir-raw-event.c
+++ b/drivers/media/IR/ir-raw-event.c
@@ -279,9 +279,11 @@ int ir_raw_event_register(struct input_dev *input_dev)
 			"rc%u",  (unsigned int)ir->devno);
 
 	if (IS_ERR(ir->raw->thread)) {
+		int ret = PTR_ERR(ir->raw->thread);
+
 		kfree(ir->raw);
 		ir->raw = NULL;
-		return PTR_ERR(ir->raw->thread);
+		return ret;
 	}
 
 	mutex_lock(&ir_raw_handler_lock);
