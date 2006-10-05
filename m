From: Don Mullis <dwm@meer.net>
Date: Thu, 05 Oct 2006 08:21:33 +0000
Subject: Re: [KJ] [PATCH] Kconfig refactoring for better menu nesting
Message-Id: <1160036493.7669.18.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159944763.7669.6.camel@localhost.localdomain>
In-Reply-To: <1159944763.7669.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > >> Index: linux-2.6.18/drivers/pci/hotplug/Kconfig
> > >> =================================> > >> --- linux-2.6.18.orig/drivers/pci/hotplug/Kconfig
> > >> +++ linux-2.6.18/drivers/pci/hotplug/Kconfig
> > >> @@ -76,7 +76,8 @@ config HOTPLUG_PCI_IBM
> > >>  
> > >>  config HOTPLUG_PCI_ACPI
> > >>  	tristate "ACPI PCI Hotplug driver"
> > >> -	depends on (!ACPI_DOCK && ACPI && HOTPLUG_PCI) || (ACPI_DOCK && HOTPLUG_PCI)
> > >> +	depends on HOTPLUG_PCI
> > >> +	depends on (!ACPI_DOCK && ACPI) || (ACPI_DOCK)
> > > 
> > > Yep, much more readable to me.
> > 
> > I'm not sure about the semantics of "depends on" but in boolean logic:
> > 
> > (!ACPI_DOCK && ACPI) || (ACPI_DOCK) = (!ACPI_DOCK || ACPI_DOCK) && (ACPI || ACPI_DOCK)
> > 
> > = (true) && (ACPI || ACPI_DOCK)
> > = ACPI || ACPI_DOCK
> > 
> > Is there something about "depends on" that would make the far simpler expression incorrect?
> 
> It's not boolean, it's tri-state (y/m/n).
> or a mix of boolean and tri-state variables.  :(

You're right.  The broken case is 
	ACPI_dock=m
	ACPI=y
where
	(!ACPI_DOCK && ACPI) || (ACPI_DOCK) = 'm'
but
	ACPI || ACPI_DOCK = 'y'



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
