From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Apr 2018 13:46:34 +0000
Subject: [PATCH] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180419134634.GA19793@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The tps_comparators[] array is used in two places.  We only access the
COMP1 (1) and COMP2 (2) elements.  Unfortunately, we're accessing the
wrong elements and also one element beyond the end of the array.  There
was supposed to be a zero element at the start of the array which is
isn't accessed but makes the math work out nicely.

Fixes: 6851ad3ab346 ("TPS65911: Comparator: Add comparator driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't actually compile this code...

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index c0789f81a1c5..35d7380f6fad 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -42,6 +42,7 @@ struct comparator {
 };
 
 static struct comparator tps_comparators[] = {
+	{	.name = "COMP", },
 	{
 		.name = "COMP1",
 		.reg = TPS65911_VMBCH,
