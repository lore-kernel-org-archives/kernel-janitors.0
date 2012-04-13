From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Apr 2012 13:39:06 +0000
Subject: [patch] w1: w1_ds28e04: unlock on error path in w1_f1C_write_pio()
Message-Id: <20120413133906.GB26645@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Markus Franke <franm@hrz.tu-chemnitz.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock here before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index f652db3..4aa1aa9 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -309,8 +309,10 @@ static ssize_t w1_f1C_write_pio(struct file *filp, struct kobject *kobj,
 	mutex_lock(&sl->master->mutex);
 
 	/* Write the PIO data */
-	if (w1_reset_select_slave(sl))
+	if (w1_reset_select_slave(sl)) {
+		mutex_unlock(&sl->master->mutex);
 		return -1;
+	}
 
 	/* set bit 7..2 to value '1' */
 	*buf = *buf | 0xFC;
