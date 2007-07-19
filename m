From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 19 Jul 2007 23:22:42 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070720002242.29b2fe8f@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -	dev = pci_get_bus_and_slot(bus, dfn);
> +	dev = pci_get_slot(pci_find_bus(0, bus), dfn);
>  	if (!dev)

What happens if pci_find_bus(0, bus) returns NULL.

And this change is not needed as pci_get_bus_and_slot now checks for
domain 0 and that was fixed.

Alan
