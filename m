From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2015 09:04:12 +0000
Subject: [patch] [patch 2/2 v2] w1: use correct lock on error in w1_seq_show()
Message-Id: <20150604090412.GE22838@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150602121255.GA20149@spacedout.fries.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Fries <David@Fries.net>, Matt Campbell <mattrcampbell@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I noticed there was a problem here because Smatch complained:

	drivers/w1/slaves/w1_therm.c:416 w1_seq_show() warn:
	inconsistent returns 'mutex:&sl->master->mutex'.
	  Locked on:   line 416
	  Unlocked on: line 413

The problem is that we lock ->mutex but we unlock ->bus_mutex on error.
David Fries says that ->bus_mutex is correct and ->mutex is incorrect.

Fixes: d9411e57dc7f ('w1: Add support for DS28EA00 sequence to w1-therm')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In the first version I changed ->bus_mutext to ->mutex instead of
    the other way around.

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index d21e686..06b034c 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -355,7 +355,7 @@ static ssize_t w1_seq_show(struct device *device,
 	struct w1_reg_num *reg_num;
 	int seq = 0;
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 	/* Place all devices in CHAIN state */
 	if (w1_reset_bus(sl->master))
 		goto error;
@@ -407,7 +407,7 @@ static ssize_t w1_seq_show(struct device *device,
 	ack = w1_read_8(sl->master);
 	if (ack != W1_42_SUCCESS_CONFIRM_BYTE)
 		goto error;
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 
 	c -= snprintf(buf + PAGE_SIZE - c, c, "%d\n", seq);
 	return PAGE_SIZE - c;
