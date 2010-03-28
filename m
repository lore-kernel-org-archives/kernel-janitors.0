From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:48:34 +0000
Subject: [patch] comedi: off by one issue
Message-Id: <20100328114834.GT5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Andrea Gelmini <andrea.gelmini@gelma.net>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"dac_range_table" has 5 elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/comedi/drivers/dt2801.c b/drivers/staging/comedi/drivers/dt2801.c
index 3f365ae..83fb6e5 100644
--- a/drivers/staging/comedi/drivers/dt2801.c
+++ b/drivers/staging/comedi/drivers/dt2801.c
@@ -472,7 +472,7 @@ static const struct comedi_lrange *dac_range_table[] = {
 
 static const struct comedi_lrange *dac_range_lkup(int opt)
 {
-	if (opt < 0 || opt > 5)
+	if (opt < 0 || opt >= 5)
 		return &range_unknown;
 	return dac_range_table[opt];
 }
