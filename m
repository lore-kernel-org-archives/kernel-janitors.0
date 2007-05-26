From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 26 May 2007 11:28:19 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <Pine.LNX.4.64.0705260723190.18950@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de>
In-Reply-To: <200705261239.27485.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Drebes <lists-receive@programmierforen.de>
Cc: kernel-janitors@lists.osdl.org, lenb@kernel.org, linux-acpi@vger.kernel.org

On Sat, 26 May 2007, Andi Drebes wrote:

> This patch replaces lines in the acpi subsystem that use
> sizeof/sizeof to determine the size of an array with the
> ARRAY_SIZE(x) macro.
>
> Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
> ---
> Compile tested with allyesconfig on i386.
> Diffed against Linus' git-tree.
>
>
> diff --git a/drivers/acpi/resources/rsdump.c b/drivers/acpi/resources/rsdump.c
> index 46da116..7b8e12d 100644
> --- a/drivers/acpi/resources/rsdump.c
> +++ b/drivers/acpi/resources/rsdump.c
> @@ -76,7 +76,7 @@ acpi_rs_dump_descriptor(void *resource, struct acpi_rsdump_info *table);
>
>  #define ACPI_RSD_OFFSET(f)          (u8) ACPI_OFFSET (union acpi_resource_data,f)
>  #define ACPI_PRT_OFFSET(f)          (u8) ACPI_OFFSET (struct acpi_pci_routing_table,f)
> -#define ACPI_RSD_TABLE_SIZE(name)   (sizeof(name) / sizeof (struct acpi_rsdump_info))
> +#define ACPI_RSD_TABLE_SIZE(name)   (ARRAY_SIZE(name))
>
>  /*******************************************************************************
>   *

  normally, what i would do in a case like the above is delete the
macro ACPI_RSD_TABLE_SIZE entirely, and replace all invocations of it
with a direct invocation of ARRAY_SIZE.  there seems to be little
value in defining a whole new macro whose only purpose in life is to
do what an already-existing macro does just as well and with more
clarity.

  but there's something else about that file that's just a bit weird.
note the form of most of those array definitions:

struct acpi_rsdump_info acpi_rs_dump_irq[6] = {
        {ACPI_RSD_TITLE, ACPI_RSD_TABLE_SIZE(acpi_rs_dump_irq), "IRQ", NULL},
        {ACPI_RSD_1BITFLAG, ACPI_RSD_OFFSET(irq.triggering), "Triggering",
         acpi_gbl_he_decode},
	...

  what's the point of **hard-coding** the array size as "6", only to
use a macro in the very next line to calculate that same value?  and
that's done throughout those array definitions.  why not just leave
the hard-coded array size out, and let the macro take care of things?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
