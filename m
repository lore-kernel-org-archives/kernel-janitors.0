From: Domen Puncer <domen@coderock.org>
Date: Thu, 18 Mar 2004 23:28:19 +0000
Subject: Re: [Kernel-janitors] tcic kj audit
Message-Id: <200403190028.19713.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <405764AD.6070905@gentoo.org>
In-Reply-To: <405764AD.6070905@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 16 of March 2004 21:33, Chuck Short wrote:
> Hi,
> 
> This patch changes char* into char[] and add's KERN_* to some printks to 
> tcic.
> 
> chuck
> 

@@ -337,7 +337,7 @@ static int __init is_active(int s)
 
     if ((sstat & TCIC_SSTAT_CD) && (pwr & TCIC_PWR_VCC(s)) &&
        (scf1 & TCIC_SCF1_IOSTS) && (ioctl & TCIC_ICTL_ENA) &&
-       (check_region(base, num) != 0) && ((base & 0xfeef) != 0x02e8))
+       (region_request(base, num) != 0) && ((base & 0xfeef) != 0x02e8))
---
What is this?
I guess you didn't compile test it :-)


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
