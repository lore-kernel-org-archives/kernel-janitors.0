From: Jim Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 21:17:50 +0000
Subject: Re: [KJ] [PATCH 6/53] radeonfb: Clean up printk()'s
Message-Id: <41F808FE.70606@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66889070133366602=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125230911.10418.3160.30244@localhost.localdomain>
In-Reply-To: <20050125230911.10418.3160.30244@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============66889070133366602==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alexey Dobriyan wrote:
> On Wednesday 26 January 2005 01:09, James Nelson wrote:
> 
> 
>>--- linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_base.c
>>+++ linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_base.c
> 
> 
>>-                        printk ("radeonfb: mode %dx%dx%d rejected, color depth invalid\n",
>>+                        printk (KERN_ERR "radeonfb: mode %dx%dx%d rejected, color depth invalid\n",
> 
> 
>>-	printk ("radeonfb (%s): %s\n", pci_name(rinfo->pdev), rinfo->name);
>>+	pr_info ("radeonfb (%s): %s\n", pci_name(rinfo->pdev), rinfo->name);
> 
> 
> "f(x)" (without space between "f" and "(") style is dominant in this file. I'd remove
> these spaces.
> 
> 	Alexey
> 


This driver needs a thorough whitespace cleanup - I was trying to minimize 
changes. I'll add this to my "needs a Lindent patch submitted later" list.

Jim

--===============66889070133366602==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66889070133366602==--
