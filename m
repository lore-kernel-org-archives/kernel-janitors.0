From: Henne <henne@nachtwindheim.de>
Date: Tue, 29 Aug 2006 08:23:48 +0000
Subject: Re: [KJ] pci_module_init to pci_module_register
Message-Id: <44F3F994.2010203@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608290058q78286131r93d63f0e8c3d1398@mail.gmail.com>
In-Reply-To: <d16b1c80608290058q78286131r93d63f0e8c3d1398@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>
> TODO:
> - convert from pci_module_init to pci_register_driver
> - don't do it for drivers that are 2.4 compatible
>
> I have found 98 occurrences of the use of pci_module_init in 2.6.18-rc4.
>   
In 2.6.18-rc4-mm3 there are only 11 left, since 2 big patches for netdev and scsi
were merged, so pci_module_init() will surely die out in the next releases.
The date is set to Jan07, but there are still new 2.6 drivers which use it.

> I would like to know what it means by "don't do it for drivers that
> are 2.4 compatible"?
>
> The drivers are in 2.6 Linux kernel, so they are meant for 2.6 alone.
> So, as long as the change is in the drivers in 2.6 code base, it
> shouldn't matter for 2.4, right? or am I missing something here?
>
>   
I think that driver maintainers don't want to keep an eye on 2 drivers which become more and more different.
So the driver gets some ifdefs to work on both, 2.4 and 2.[56].
But now since 2.4 takes no new features and is __just__ bugfixing the development of these drivers
stands still in 2.4-tree.
And after the change of the IRQ-flags namespace change the 2.6-drivers the compatibility is definitively broken.
Thats imho the reason to break this and make the drivers __fit-2.6-only__.
But thats just my opinion.

Greets,
Henne

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
