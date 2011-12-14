From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Dec 2011 06:17:36 +0000
Subject: [patch] [media] tm6000: using an uninitialized variable in debug code
Message-Id: <20111214061736.GA7499@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, Thierry Reding <thierry.reding@avionic-design.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

dprintk() dereferences "ir".  I'm not sure why gcc doesn't complain
about this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/video/tm6000/tm6000-input.c b/drivers/media/video/tm6000/tm6000-input.c
index 8d92527..7844607 100644
--- a/drivers/media/video/tm6000/tm6000-input.c
+++ b/drivers/media/video/tm6000/tm6000-input.c
@@ -408,13 +408,13 @@ int tm6000_ir_init(struct tm6000_core *dev)
 	if (!dev->ir_codes)
 		return 0;
 
-	dprintk(2, "%s\n",__func__);
-
 	ir = kzalloc(sizeof(*ir), GFP_ATOMIC);
 	rc = rc_allocate_device();
 	if (!ir || !rc)
 		goto out;
 
+	dprintk(2, "%s\n", __func__);
+
 	/* record handles to ourself */
 	ir->dev = dev;
 	dev->ir = ir;
