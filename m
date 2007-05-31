From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 31 May 2007 09:56:03 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <20070531095603.GA24654@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de> <46581C06.7000005@student.ltu.se> <200705261558.24912.lists-receive@programmierforen.de> <200705301525.05905.lenb@kernel.org>
In-Reply-To: <200705301525.05905.lenb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: Andi Drebes <lists-receive@programmierforen.de>, kernel-janitors@lists.osdl.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 30, 2007 at 03:25:05PM -0400, Len Brown wrote:
>  
> > > Any reason to not just replace ACPI_RSD_TABLE_SIZE with ARRAY_SIZE?
> 
> Probably because ARRAY_SIZE doesn't exist in ACPICA, which is
> where this code comes from...
> 
> When we change syntax in ACPICA files in Linux to make it more "beautiful",
> then it creates more work for me -- as forever on, that syntax difference
> must be manually compared to upstream ACPICA and Linux -- and that syntax
> difference causes upstream patches to no longer apply and require
> hand merging.

Or we could stop that ACPCICA crap ASAP.  The acpi code not only looks
like crap because of that but it's buggy as hell now.

Intel is claiming how great linux is and how supportive is to it, but
can't even write proper code for their abomination of a firmware standard.
This is really more than dishonest.  Please take patches to get acpi into
shape and stop this complaining.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
