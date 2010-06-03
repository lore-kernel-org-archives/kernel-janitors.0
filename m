From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Jun 2010 09:56:13 +0000
Subject: [patch] isdn/kcapi: return -EFAULT on copy_from_user errors
Message-Id: <20100603095613.GP5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, Jan Kiszka <jan.kiszka@web.de>, Tilman Schmidt <tilman@imap.cc>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_from_user() returns the number of bytes remaining but we should
return -EFAULT here.  The error code gets returned to the user.  Both 
old_capi_manufacturer() and capi20_manufacturer() had other places
that already returned -EFAULT so this won't break anything.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
index bde3c88..b054494 100644
--- a/drivers/isdn/capi/kcapi.c
+++ b/drivers/isdn/capi/kcapi.c
@@ -1020,12 +1020,12 @@ static int old_capi_manufacturer(unsigned int cmd, void __user *data)
 		if (cmd = AVMB1_ADDCARD) {
 		   if ((retval = copy_from_user(&cdef, data,
 					    sizeof(avmb1_carddef))))
-			   return retval;
+			   return -EFAULT;
 		   cdef.cardtype = AVM_CARDTYPE_B1;
 		} else {
 		   if ((retval = copy_from_user(&cdef, data,
 					    sizeof(avmb1_extcarddef))))
-			   return retval;
+			   return -EFAULT;
 		}
 		cparams.port = cdef.port;
 		cparams.irq = cdef.irq;
@@ -1218,7 +1218,7 @@ int capi20_manufacturer(unsigned int cmd, void __user *data)
 		kcapi_carddef cdef;
 
 		if ((retval = copy_from_user(&cdef, data, sizeof(cdef))))
-			return retval;
+			return -EFAULT;
 
 		cparams.port = cdef.port;
 		cparams.irq = cdef.irq;
