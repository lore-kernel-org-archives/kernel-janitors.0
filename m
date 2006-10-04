From: Mark Hollomon <markhollomon@comcast.net>
Date: Wed, 04 Oct 2006 20:02:59 +0000
Subject: Re: [KJ] [PATCH] Kconfig refactoring for better menu nesting
Message-Id: <45241373.4010503@comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159944763.7669.6.camel@localhost.localdomain>
In-Reply-To: <1159944763.7669.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy Dunlap wrote:
> On Tue, 03 Oct 2006 23:52:43 -0700 Don Mullis wrote:
> 
>> Refactor Kconfig content to maximize nesting of menus by menuconfig
>> and xconfig.  No functional changes.
>>

...

>> Index: linux-2.6.18/drivers/pci/hotplug/Kconfig
>> =================================>> --- linux-2.6.18.orig/drivers/pci/hotplug/Kconfig
>> +++ linux-2.6.18/drivers/pci/hotplug/Kconfig
>> @@ -76,7 +76,8 @@ config HOTPLUG_PCI_IBM
>>  
>>  config HOTPLUG_PCI_ACPI
>>  	tristate "ACPI PCI Hotplug driver"
>> -	depends on (!ACPI_DOCK && ACPI && HOTPLUG_PCI) || (ACPI_DOCK && HOTPLUG_PCI)
>> +	depends on HOTPLUG_PCI
>> +	depends on (!ACPI_DOCK && ACPI) || (ACPI_DOCK)
> 
> Yep, much more readable to me.

I'm not sure about the semantics of "depends on" but in boolean logic:

(!ACPI_DOCK && ACPI) || (ACPI_DOCK) = (!ACPI_DOCK || ACPI_DOCK) && (ACPI || ACPI_DOCK)

= (true) && (ACPI || ACPI_DOCK)
= ACPI || ACPI_DOCK

Is there something about "depends on" that would make the far simpler expression incorrect?



-- 
Mark Hollomon
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
