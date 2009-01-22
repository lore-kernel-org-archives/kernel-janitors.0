From: Karsten Keil <kkeil@suse.de>
Date: Thu, 22 Jan 2009 22:18:27 +0000
Subject: Re: [PATCH] Fix missing ifdef in isdn_ppp
Message-Id: <20090122221827.GA28623@pingi.kke.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090122141034.GA15246@milesteg.arr>
In-Reply-To: <20090122141034.GA15246@milesteg.arr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

The following patch fixes a warning caused by a missing ifdef in
isdn_ppp.c. A function was defined, but never used if CONFIG_IPPP_FILTER
was not defined.

The warning was: ‘get_filter’ defined but not used
Patch is against 2.6.28.1

Signed-off-by: Daniele Venzano <venza@brownhat.org>
Acked-by: Karsten Keil <kkeil@suse.de>

--- a/drivers/isdn/i4l/isdn_ppp.c	2009-01-22 15:01:27.000000000 +0100
+++ b/drivers/isdn/i4l/isdn_ppp.c	2009-01-22 15:01:59.000000000 +0100
@@ -431,6 +431,7 @@ set_arg(void __user *b, void *val,int le
 	return 0;
 }
 
+#ifdef CONFIG_IPPP_FILTER
 static int get_filter(void __user *arg, struct sock_filter **p)
 {
 	struct sock_fprog uprog;
@@ -465,6 +466,7 @@ static int get_filter(void __user *arg, 
 	*p = code;
 	return uprog.len;
 }
+#endif /* CONFIG_IPPP_FILTER */
 
 /*
  * ippp device ioctl

-- 
Karsten Keil
SuSE Labs
ISDN and VOIP development
SUSE LINUX Products GmbH, Maxfeldstr.5 90409 Nuernberg, GF: Markus Rex, HRB 16746 (AG Nuernberg)
