From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 05 Apr 2004 20:36:23 +0000
Subject: Re: [Kernel-janitors] [PATCH] 81 patches for strings
Message-Id: <20040405133623.639cbeca.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040319150659.GA20615@localhost>
In-Reply-To: <20040319150659.GA20615@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 19 Mar 2004 17:54:39 +0100 Domen Puncer wrote:

| On Friday 19 of March 2004 16:06, Carlo Perassi wrote:
| > Hi.
| > With some scripting and manual check, I patched 81 files
| 
| Too much scripting maybe?

or too little?


| >From patches_arch/file2WYyJB:
| --- old/arch/arm/mm/mm-armv.c	2004-03-19 15:05:55.000000000 +0100
| +++ new/arch/arm/mm/mm-armv.c	2004-03-19 15:04:42.000000000 +0100
| @@ -103,14 +103,14 @@
|  
|  static void __init early_nocache(char **__unused)
|  {
| -	char *p = "buffered";
| +	char *p[] = "buffered";

argh.  All 80 or 81 files have this problem!!!

| gcc would detect this. (ok, arch is not a nice example for compile test, but 
| you get the point)

Carlo, if you care to fix these up and resend them, go for it....

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
