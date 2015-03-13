From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Mar 2015 09:11:06 +0000
Subject: [patch 1/2] usb: gadget: printer: delete some dead code
Message-Id: <20150313091106.GB18923@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"num" is a u16 so it can't go higher than 65535.  kstrtou16() has a
range check built in so this is already handled.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 757fcf0..caa56de 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1223,11 +1223,6 @@ static ssize_t f_printer_opts_q_len_store(struct f_printer_opts *opts,
 	if (ret)
 		goto end;
 
-	if (num > 65535) {
-		ret = -EINVAL;
-		goto end;
-	}
-
 	opts->q_len = (unsigned)num;
 	ret = len;
 end:
