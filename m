From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 16:36:58 +0000
Subject: Re: [KJ] [PATCH] - request_region
Message-Id: <20060204113658.7s1bqhuidw40mc0g@webmail.rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
In-Reply-To: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Quoting Jaco Kroon <jaco@kroon.co.za>:

> Ron Gage wrote:
>> Greetings:
>>
>> Trial patch - want to make sure that I am doing things "correctly" 
>> before I dive
>> in too far...
>>
>> diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c
>> linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c
>
> I don't think there is a reason to show the diff command.
>

Diff puts that in there - shall I remove it?


>> --- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c  2006-01-02
>> 21:21:10.000000000 -0600
>> +++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c       2006-02-04
>> 10:29:03.000000000 -0600
>
> line wrapped.
>

Will fix by attaching the diff instead of just cut and paste...


>> @@ -142,9 +142,12 @@
>>                 tmp = inl (PCI_REG(SH7751_PCIPAR));
>>                 outl (0x80000000, PCI_REG(SH7751_PCIPAR));
>>                 if (inl (PCI_REG(SH7751_PCIPAR)) = 0x80000000) {
>> +                       struct resource *region;
>>                         outl (tmp, PCI_REG(SH7751_PCIPAR));
>>                         printk(KERN_INFO "PCI: Using configuration 
>> type 1\n");
>> -                       request_region(PCI_REG(SH7751_PCIPAR), 8, 
>> "PCI conf1");
>> +                       region = 
>> request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI
>> conf1");
>> +                       if (!region)
>> +                               return -EBUSY;
>>                         return 0;
>>                 }
>>                 outl (tmp, PCI_REG(SH7751_PCIPAR));
>
> the leading whitespace in this case is spaces, it should be tabs.
> Easily converted with the unexpand utility but that is an extra step and
> will break the patch as one will then need to also add an extra space in
> for every line that doesn't start with a + or a -.
>

The file is actually tabs as are the changes I made.  Probably an artifact of
the cut and paste.  I'll verify the spaces versus tabs thing and resubmit.



> Jaco
> --
> There are only 10 kinds of people in this world,
>  those that understand binary and those that don't.
> http://www.kroon.co.za/
>



-- 
Ron Gage
(LPIC1 MCP A+ Net+)
Westland, Michigan

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
