From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:20:15 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/net
Message-Id: <1161634815.419.14.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc2-git7/drivers/net/tulip/de2104x.c.orig	2006-10-23 21:24:42.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/net/tulip/de2104x.c	2006-10-23 21:25:08.000000000 +0200
@@ -1906,9 +1906,7 @@ fill_defaults:
 			de->media[i].csr15 = t21041_csr15[i];
 	}
 
-	de->ee_data = kmalloc(DE_EEPROM_SIZE, GFP_KERNEL);
-	if (de->ee_data)
-		memcpy(de->ee_data, &ee_data[0], DE_EEPROM_SIZE);
+	de->ee_data = kmemdup(&ee_data[0], DE_EEPROM_SIZE, GFP_KERNEL);
 
 	return;
 
--- linux-2.6.19-rc2-git7/drivers/net/wireless/ipw2100.c.orig	2006-10-23 21:26:26.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/net/wireless/ipw2100.c	2006-10-23 21:27:14.000000000 +0200
@@ -7568,11 +7568,10 @@ static int ipw2100_wx_set_genie(struct n
 		return -EINVAL;
 
 	if (wrqu->data.length) {
-		buf = kmalloc(wrqu->data.length, GFP_KERNEL);
+		buf = kmemdup(extra, wrqu->data.length, GFP_KERNEL);
 		if (buf = NULL)
 			return -ENOMEM;
 
-		memcpy(buf, extra, wrqu->data.length);
 		kfree(ieee->wpa_ie);
 		ieee->wpa_ie = buf;
 		ieee->wpa_ie_len = wrqu->data.length;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
