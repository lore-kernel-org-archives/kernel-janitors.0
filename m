From: "Shakthi Kannan" <shakthimaan@gmail.com>
Date: Tue, 29 Aug 2006 08:10:40 +0000
Subject: [KJ] pci_module_init to pci_module_register
Message-Id: <d16b1c80608290058q78286131r93d63f0e8c3d1398@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

TODO:
- convert from pci_module_init to pci_register_driver
- don't do it for drivers that are 2.4 compatible

I have found 98 occurrences of the use of pci_module_init in 2.6.18-rc4.

I would like to know what it means by "don't do it for drivers that
are 2.4 compatible"?

The drivers are in 2.6 Linux kernel, so they are meant for 2.6 alone.
So, as long as the change is in the drivers in 2.6 code base, it
shouldn't matter for 2.4, right? or am I missing something here?

Thanks,

SK

-- 
Shakthi Kannan
http://www.shakthimaan.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
