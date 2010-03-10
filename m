From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Mar 2010 20:27:11 +0000
Subject: Re: discussion [patch] /lib/kobject.c
Message-Id: <Pine.LNX.4.64.1003102125510.1672@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B975F28.4050903@bfs.de>
In-Reply-To: <4B975F28.4050903@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I guess something similar could be done with snprintf?

The following code comes from /var/linuxes/linux-next/arch/ia64/pci/pci.c

	len = strlen(info->name) + 32;
        name = kzalloc(len, GFP_KERNEL);
	if (!name) {
                printk(KERN_ERR "PCI: No memory for %s I/O port space name\n",
			info->name);
                goto free_resource;
        }

        min = addr->minimum;
        max = min + addr->address_length - 1;
        if (addr->info.io.translation_type = ACPI_SPARSE_TRANSLATION)
                sparse = 1;

	space_nr = new_space(addr->translation_offset, sparse);
        if (space_nr = ~0)
	        goto free_name;

	base = __pa(io_space[space_nr].mmio_base);
	base_port = IO_SPACE_BASE(space_nr);
        snprintf(name, len, "%s I/O Ports %08lx-%08lx", info->name,
                base_port + min, base_port + max);

julia
