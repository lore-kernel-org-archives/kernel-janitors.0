From: "Scott Thompson" <postfail@hushmail.com>
Date: Wed, 15 Aug 2007 04:35:01 +0000
Subject: Re: [PATCH 1 of 5 ] /drivers/char ioremap balancing/ returncode check
Message-Id: <20070815043503.535662281F@mailserver9.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070813040039.71A3DDA820@mailserver8.hushmail.com>
In-Reply-To: <20070813040039.71A3DDA820@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jirislaby@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 13 Aug 2007 16:17:29 -0400 Jiri Slaby <jirislaby@gmail.com> 
wrote:
>> diff --git a/drivers/char/sx.c b/drivers/char/sx.c
>> index 85a2328..30829ed 100644
>> --- a/drivers/char/sx.c
>> +++ b/drivers/char/sx.c
>> @@ -2627,6 +2627,12 @@ static void __devinit fix_sx_pci(struct 
>> pci_dev *pdev, struct sx_board *board)
>>  	pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &hwbase);
>>  	hwbase &= PCI_BASE_ADDRESS_MEM_MASK;
>>  	rebase = ioremap(hwbase, 0x80);
>> +	if (!rebase) {
>> +		printk(KERN_DEBUG 
>> +			"sx:ioremap fail, unable to perform cntrl reg fix\n");
>> +		return;
>> +	}
>> +		
>
>1) this should be pci_iomap(pdev, 0, 0x80)
The ioremap call was there before my patch and I'm just trying to 
audit ioremap calls to make sure that they are cleaned up and have 
their return codes checked.   If you want me to take care of that 
"while I'm in the neighborhood", let me know, but trying to avoid 
too much scope creep on my audit to increase chances it actually 
gets included...

>2) KERN_DEBUG is inappropriate and wrap the string in the middle 
>and not in the
>beginning

Agree on the wordwrap, several artifacts were created on this 
patchset and this whole thing will be resubmitted through a 
different mail client. 
As for KERN_DEBUG, KERN_DEBUG is used in the function following 
this call as notification that this workaround was required.  When 
I audit code as I am here I generally try to blend the patch in 
with the style and conventions of the code around it.  If 
KERN_DEBUG is inappropriate on the subsequent call, both values 
should be changed.  

Let me know your preferences on these issues and I will include in 
the next pass.  Thanks for your comments and review...

---------------------------------------
Scott Thompson / postfail@hushmail.com
---------------------------------------

