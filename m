From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Oct 2014 10:40:37 +0000
Subject: [patch] usb: gadget: f_uac1: remove an unneeded NULL check
Message-Id: <20141008104037.GB23096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This NULL check sets off a static checker warning because we already
dereferenced "card" earlier in the function.  However, since "card" is
never NULL so we can just remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/u_uac1.c b/drivers/usb/gadget/function/u_uac1.c
index a44a07f..53842a1 100644
--- a/drivers/usb/gadget/function/u_uac1.c
+++ b/drivers/usb/gadget/function/u_uac1.c
@@ -213,9 +213,6 @@ static int gaudio_open_snd_dev(struct gaudio *card)
 	fn_cap = opts->fn_cap;
 	fn_cntl = opts->fn_cntl;
 
-	if (!card)
-		return -ENODEV;
-
 	/* Open control device */
 	snd = &card->control;
 	snd->filp = filp_open(fn_cntl, O_RDWR, 0);
