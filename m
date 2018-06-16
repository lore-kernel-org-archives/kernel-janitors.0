From: Joe Perches <joe@perches.com>
Date: Sat, 16 Jun 2018 23:13:59 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix line over 80 characters
Message-Id: <5ad0ea84d5b8733e7bb7a647e185f2577c073cf5.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1909265.MoDodiKBI3@os-virtualbox>
         <127735.1529176927@turing-police.cc.vt.edu>
In-Reply-To: <127735.1529176927@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: valdis.kletnieks@vt.edu, Hyunil Kim <thtlwlsmsgkfla@gmail.com>
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, colin.king@canonical.com, johannes.berg@intel.com, Linyu.Yuan@alcatel-sbell.com.cn, keescook@chromium.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2018-06-16 at 15:22 -0400, valdis.kletnieks@vt.edu wrote:
> On Sat, 16 Jun 2018 15:00:31 +0900, Hyunil Kim said:
> > *fix checkpatch.pl warnings:
> >  WARNING: line over 80 characters
> > +		if (((ieee->wpa_ie[0] = 0xdd) &&
> > +		    (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
> > +		    ((ieee->wpa_ie[0] = 0x30) &&
> > +		    (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
> 
> Ouch. The && and || at ends of line mean a lot of parenthesis counting to
> figure out which goes with which.  Use additional indentation to help
> understanding.
> 
> +		if (((ieee->wpa_ie[0] = 0xdd) &&
> +			(!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
> +		    ((ieee->wpa_ie[0] = 0x30) &&
> +			(!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
> 
> Or perhaps
> 
> +		if (((ieee->wpa_ie[0] = 0xdd) &&
> +			(!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4)))
> +		     || ((ieee->wpa_ie[0] = 0x30) &&
> +			(!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))

Or perhaps refactor to something like:
---
 drivers/staging/rtl8192u/r8192U_core.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 8b17400f6c13..593ecc0ae1ae 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2039,20 +2039,18 @@ static bool GetNmodeSupportBySecCfg8192(struct net_device *dev)
 		   (strcmp(crypt->ops->name, "WEP") = 0));
 
 	/* simply judge  */
-	if (encrypt && (wpa_ie_len = 0)) {
-		/* wep encryption, no N mode setting */
+	/* wep encryption, no N mode setting */
+	if (encrypt && wpa_ie_len = 0)
 		return false;
-	} else if ((wpa_ie_len != 0)) {
-		/* parse pairwise key type */
-		if (((ieee->wpa_ie[0] = 0xdd) && (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) || ((ieee->wpa_ie[0] = 0x30) && (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
-			return true;
-		else
-			return false;
-	} else {
+
+	if (wpa_ie_len = 0)
 		return true;
-	}
 
-	return true;
+	/* parse pairwise key type */
+	return (ieee->wpa_ie[0] = 0xdd &&
+		!memcmp(&ieee->wpa_ie[14], ccmp_ie, 4)) ||
+	       (ieee->wpa_ie[0] = 0x30 &&
+		!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4));
 }
 
 static bool GetHalfNmodeSupportByAPs819xUsb(struct net_device *dev)

