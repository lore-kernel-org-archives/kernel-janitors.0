From: Len Brown <lenb@kernel.org>
Date: Wed, 30 May 2007 19:25:05 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <200705301525.05905.lenb@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de> <46581C06.7000005@student.ltu.se> <200705261558.24912.lists-receive@programmierforen.de>
In-Reply-To: <200705261558.24912.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Drebes <lists-receive@programmierforen.de>
Cc: Richard Knutsson <ricknu-0@student.ltu.se>, kernel-janitors@lists.osdl.org, linux-acpi@vger.kernel.org

 
> > Any reason to not just replace ACPI_RSD_TABLE_SIZE with ARRAY_SIZE?

Probably because ARRAY_SIZE doesn't exist in ACPICA, which is
where this code comes from...

When we change syntax in ACPICA files in Linux to make it more "beautiful",
then it creates more work for me -- as forever on, that syntax difference
must be manually compared to upstream ACPICA and Linux -- and that syntax
difference causes upstream patches to no longer apply and require
hand merging.

If you can license your patches to ACPICA files (drivers/acpi/*/*)
back to Intel to re-distribute under _both_ licenses at the top
of the file, then I'll be happy to apply them.
Otherwise, I'm really not excited about creating work
for no functional benefit.

thanks,
-Len
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
