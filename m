From: Domen Puncer <domen@coderock.org>
Date: Fri, 19 Mar 2004 16:54:39 +0000
Subject: Re: [Kernel-janitors] [PATCH] 81 patches for strings
Message-Id: <200403191754.39482.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040319150659.GA20615@localhost>
In-Reply-To: <20040319150659.GA20615@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 19 of March 2004 16:06, Carlo Perassi wrote:
> Hi.
> With some scripting and manual check, I patched 81 files

Too much scripting maybe?
From patches_arch/file2WYyJB:
--- old/arch/arm/mm/mm-armv.c	2004-03-19 15:05:55.000000000 +0100
+++ new/arch/arm/mm/mm-armv.c	2004-03-19 15:04:42.000000000 +0100
@@ -103,14 +103,14 @@
 
 static void __init early_nocache(char **__unused)
 {
-	char *p = "buffered";
+	char *p[] = "buffered";


gcc would detect this. (ok, arch is not a nice example for compile test, but 
you get the point)


	Domen

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
