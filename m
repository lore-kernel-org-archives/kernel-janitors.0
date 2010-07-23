From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Jul 2010 11:47:06 +0000
Subject: [patch] message/i2o: add sanity check
Message-Id: <20100723114706.GH26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Markus.Lidel@shadowconnect.com
Cc: kernel-janitors@vger.kernel.org

We use "reply_size" to determine the size of the "reply" buffer.  These
days the "reply" buffer is just some context information, an error code,
and a bunch of zeroes.  We stopped using it for useful information four
years ago in dcceafe25a5f47 "[PATCH] I2O: Bugfixes"

This patch ensures that "reply" is large enough to hold the context
information.   In the current code if "reply_size" is zero that would
cause memory corruption when we save the error code:
	reply[4] = ((u32) rcode) << 24;

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/message/i2o/i2o_config.c b/drivers/message/i2o/i2o_config.c
index c4b117f..8b1d55e 100644
--- a/drivers/message/i2o/i2o_config.c
+++ b/drivers/message/i2o/i2o_config.c
@@ -817,6 +817,11 @@ static int i2o_cfg_passthru(unsigned long arg)
 	reply_size >>= 16;
 	reply_size <<= 2;
 
+	if (reply_size < 5 * sizeof(u32)) {
+		rcode = -EINVAL;
+		goto out;
+	}
+
 	reply = kzalloc(reply_size, GFP_KERNEL);
 	if (!reply) {
 		printk(KERN_WARNING "%s: Could not allocate reply buffer\n",
