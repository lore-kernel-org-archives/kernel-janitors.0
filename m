From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 20:26:05 +0000
Subject: [patch v2] touchscreen/bu21013_ts: null dereference in error
Message-Id: <20101027202605.GH6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101027100822.GF6062@bicker> <20101027154613.GA8745@core.coreip.homeip.net>
In-Reply-To: <20101027154613.GA8745@core.coreip.homeip.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@euromail.se>, Naveen Kumar Gaddipati <naveen.gaddipati@stericsson.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code "bu21013_data" could be NULL here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
V2:  same thing; different approach.

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index ccde586..2ca9e5d 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -514,7 +514,7 @@ err_free_irq:
 err_cs_disable:
 	pdata->cs_dis(pdata->cs_pin);
 err_free_mem:
-	input_free_device(bu21013_data->in_dev);
+	input_free_device(in_dev);
 	kfree(bu21013_data);
 
 	return error;
