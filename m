From: Jiri Slaby <jirislaby@gmail.com>
Date: Wed, 15 Aug 2007 19:36:12 +0000
Subject: Re: [PATCH 1 of 5 ] /drivers/char ioremap balancing/ returncode check
Message-Id: <46C355AC.3040604@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070815043503.535662281F@mailserver9.hushmail.com>
In-Reply-To: <20070815043503.535662281F@mailserver9.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Scott Thompson napsal(a):
> On Mon, 13 Aug 2007 16:17:29 -0400 Jiri Slaby <jirislaby@gmail.com> 
> wrote:
>>> diff --git a/drivers/char/sx.c b/drivers/char/sx.c
>>> index 85a2328..30829ed 100644
>>> --- a/drivers/char/sx.c
>>> +++ b/drivers/char/sx.c
>>> @@ -2627,6 +2627,12 @@ static void __devinit fix_sx_pci(struct 
>>> pci_dev *pdev, struct sx_board *board)
>>>  	pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &hwbase);
>>>  	hwbase &= PCI_BASE_ADDRESS_MEM_MASK;
>>>  	rebase = ioremap(hwbase, 0x80);
>>> +	if (!rebase) {
>>> +		printk(KERN_DEBUG 
>>> +			"sx:ioremap fail, unable to perform cntrl reg fix\n");
>>> +		return;
>>> +	}
>>> +		
>> 1) this should be pci_iomap(pdev, 0, 0x80)
> The ioremap call was there before my patch and I'm just trying to 
> audit ioremap calls to make sure that they are cleaned up and have 
> their return codes checked.   If you want me to take care of that 
> "while I'm in the neighborhood", let me know, but trying to avoid 
> too much scope creep on my audit to increase chances it actually 
> gets included...

Yup, while you are at it, make yet another patch, which will convert this to
pci_iomap/unmap.

> 
>> 2) KERN_DEBUG is inappropriate and wrap the string in the middle 
>> and not in the
>> beginning
> 
> Agree on the wordwrap, several artifacts were created on this 
> patchset and this whole thing will be resubmitted through a 
> different mail client. 

Aha. Anyways, if it's more that 80 columns in width, split it into more lines.

> As for KERN_DEBUG, KERN_DEBUG is used in the function following 
> this call as notification that this workaround was required.  When 
> I audit code as I am here I generally try to blend the patch in 
> with the style and conventions of the code around it.  If 
> KERN_DEBUG is inappropriate on the subsequent call, both values 
> should be changed.  

Only a string, where you warn an user, that something went wrong and this and
over that won't work... KERN_DEBUG messages are usually NOT logged. I suggest
KERN_ERR for mapping failure and KERN_INFO for the message about the workaround
is being used.

-- 
Jiri Slaby (jirislaby@gmail.com)
Faculty of Informatics, Masaryk University
