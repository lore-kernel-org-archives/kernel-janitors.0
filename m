From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Jun 2015 09:55:37 +0000
Subject: [patch 1/2] w1: fix for loop exit condition in w1_seq_show()
Message-Id: <20150601095537.GA897@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Matt Campbell <mattrcampbell@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Fries <David@Fries.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The W1_42_FINISHED_BYTE is 0xFF so the cast means the condition is
never true.

Fixes: d9411e57dc7f ('w1: Add support for DS28EA00 sequence to w1-therm')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index d21e686..3351be6 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -378,7 +378,7 @@ static ssize_t w1_seq_show(struct device *device,
 		w1_write_8(sl->master, W1_42_COND_READ);
 		rv = w1_read_block(sl->master, (u8 *)&rn, 8);
 		reg_num = (struct w1_reg_num *) &rn;
-		if ((char)reg_num->family = W1_42_FINISHED_BYTE)
+		if (reg_num->family = W1_42_FINISHED_BYTE)
 			break;
 		if (sl->reg_num.id = reg_num->id)
 			seq = i;
