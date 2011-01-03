From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:47:40 +0000
Subject: [patch 2/2] Staging: tm6000: silence Sparse warning "dubious: !x |
Message-Id: <20110103054740.GS1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Bitwise and logical or are the equivalent here, so this doesn't affect
runtime, but logical or was intended.  The original code causes a
warning in Sparse:  "warning: dubious: !x | !y"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/tm6000/tm6000-input.c b/drivers/staging/tm6000/tm6000-input.c
index aee5e85..dae2f1f 100644
--- a/drivers/staging/tm6000/tm6000-input.c
+++ b/drivers/staging/tm6000/tm6000-input.c
@@ -376,7 +376,7 @@ int tm6000_ir_init(struct tm6000_core *dev)
 
 	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
 	rc = rc_allocate_device();
-	if (!ir | !rc)
+	if (!ir || !rc)
 		goto out;
 
 	/* record handles to ourself */
