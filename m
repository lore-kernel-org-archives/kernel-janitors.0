From: "Nish Aravamudan" <nish.aravamudan@gmail.com>
Date: Sat, 27 May 2006 20:09:34 +0000
Subject: Re: [KJ] [PATCH] drivers/char/mxser.c : replace pci_find_device by
Message-Id: <29495f1d0605271309o6378be4bqa952ef82ed79fa69@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4478AF44.3040701@yahoo.fr>
In-Reply-To: <4478AF44.3040701@yahoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/27/06, trem <tremyfr@yahoo.fr> wrote:
> From: trem <tremyfr@yahoo.fr>
>
> This patch simply change pci_find_device by pci_get_device, because
> pci_find_device is deprecated. pci_dev_put has been added after the
> loop to decrement the counter if necessary.

Can't the pci_dev_put() be unconditional? pci_dev_put() does the
checking for NULL itself, it would seem. There are two cases that are
(logicall, not practically, possible):

1) We don't even enter the while loop, which can only occur if someone
alters mxser_pcibrds[]. In this case, we'll call pci_dev_put(pdev),
pdev = NULL, and return from the call immediately.

2) We need to clean-up the last iteration of the loop. In this case
pci_dev_put(pdev) will do the right thing.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
