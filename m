From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 19 Jan 2005 14:52:48 +0000
Subject: Re: [KJ] [PATCH] drivers/ide/pci/cs5520.c fix return code value
Message-Id: <41EE7440.8020905@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106126053.13875.59.camel@localhost.localdomain>
In-Reply-To: <1106126053.13875.59.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:
> On 19/01/05 14:44 +0530, Amit Gud wrote:
> 
>>Description: The patch follows from the suggestions by AC and Felipe W
>>Damasio for fixing the return codes from IDE drivers.
>>
>>+++ linux-2.6.9/drivers/ide/pci/cs5520.c        2005-01-19
>>14:23:50.000000000 +0530
>>@@ -224,7 +224,7 @@
>>        if(pci_enable_device_bars(dev, 1<<2))

also, please use diff -up as indicated in
Documentation/SubmittingPatches .

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
