From: Richard <h.vanberkum@chello.nl>
Date: Tue, 11 Jul 2006 22:02:55 +0000
Subject: Re: [KJ] [PATCH] drivers/parisc/superio.c: check return values of
Message-Id: <44B4200F.201@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060711020442.GA17650@chello.nl>
In-Reply-To: <20060711020442.GA17650@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy.Dunlap wrote:

Hello Randy,


>> +	if (!(request_region (IC_PIC1, 0x1f, "pic1"))) {
> 
> Coding style:  no extra parens (like after !).
> 	no space after function name.

The space must be a mistake. About the parens I didn't know. Thanks

> 
>> +		printk(KERN_ERR "can't get I/O %x\n", IC_PIC1);
>> +		goto err1;
>> +	}
>> +	
>> +	if(!(request_region (IC_PIC2, 0x1f, "pic2"))) {
> 
> space after "if".  drop "!()" parens.
> no space after function name.

Clear :)


>>  	/* Enable the legacy I/O function */
>>  	pci_read_config_word (pdev, PCI_COMMAND, &word);
>> @@ -276,10 +287,22 @@ superio_init(struct pci_dev *pcidev)
>>  
>>  		printk(KERN_ERR PFX "could not get irq\n");
>>  		BUG();
>> -		return;
>> +		
>> +		/*Free resources previously requested*/
> 
> See above /* comment for spacing.

I see for clarity I gues. I'll try to remember.



>> +err1:	return; 
>> +
>>  }
> 
> Put labels and statements on separate lines.

Ok. That was some good input on coding style.Thanks, but it's no use to continue on this with regard to the previous post
> 
> ---
> ~Randy
> 

Richard


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
