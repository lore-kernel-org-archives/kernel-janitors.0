From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 06:31:00 +0000
Subject: [patch] media: ir-keytable: null dereference in debug code
Message-Id: <20100806063059.GN9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"ir_dev->props" can be NULL.  We only use raw mode if "ir_dev->props" is
non-NULL and "ir_dev->props->driver_type = RC_DRIVER_IR_RAW".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/IR/ir-keytable.c b/drivers/media/IR/ir-keytable.c
index 15a0f19..cf97427 100644
--- a/drivers/media/IR/ir-keytable.c
+++ b/drivers/media/IR/ir-keytable.c
@@ -499,7 +499,8 @@ int __ir_input_register(struct input_dev *input_dev,
 
 	IR_dprintk(1, "Registered input device on %s for %s remote%s.\n",
 		   driver_name, rc_tab->name,
-		   ir_dev->props->driver_type = RC_DRIVER_IR_RAW ? " in raw mode" : "");
+		   (ir_dev->props && ir_dev->props->driver_type = RC_DRIVER_IR_RAW) ?
+			" in raw mode" : "");
 
 	return 0;
 
