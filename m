From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:20:43 +0000
Subject: [patch] Staging: comedi: integer overflow in do_insnlist_ioctl()
Message-Id: <20111104182043.GA5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is an integer overflow here that could cause memory corruption
on 32 bit systems.

insnlist.n_insns could be a very high value size calculation for
kmalloc() could overflow resulting in a smaller "insns" than
expected.  In the for (i = 0; i < insnlist.n_insns; i++) {... loop
we would read past the end of the buffer, possibly corrupting memory
as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index 21d8c1c..3b4017f 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -670,6 +670,11 @@ static int do_insnlist_ioctl(struct comedi_device *dev,
 		goto error;
 	}
 
+	if (sizeof(struct comedi_insn) * insnlist.n_insns < insnlist.n_insns) {
+		ret = -EINVAL;
+		goto error;
+	}
+
 	insns  	    kmalloc(sizeof(struct comedi_insn) * insnlist.n_insns, GFP_KERNEL);
 	if (!insns) {
