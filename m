From: Pavel Machek <pavel@ucw.cz>
Date: Sun, 10 Jun 2007 10:57:12 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <20070610105712.GA4695@ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de> <46581C06.7000005@student.ltu.se> <200705261558.24912.lists-receive@programmierforen.de> <200705301525.05905.lenb@kernel.org> <20070531095603.GA24654@infradead.org>
In-Reply-To: <20070531095603.GA24654@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>, Len Brown <lenb@kernel.org>, Andi Drebes <lists-receive@programmierforen.de>, kernel-janitors@lists.osdl.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

Hi!

> > > > Any reason to not just replace ACPI_RSD_TABLE_SIZE with ARRAY_SIZE?
> > 
> > Probably because ARRAY_SIZE doesn't exist in ACPICA, which is
> > where this code comes from...
> > 
> > When we change syntax in ACPICA files in Linux to make it more "beautiful",
> > then it creates more work for me -- as forever on, that syntax difference
> > must be manually compared to upstream ACPICA and Linux -- and that syntax
> > difference causes upstream patches to no longer apply and require
> > hand merging.
> 
> Or we could stop that ACPCICA crap ASAP.  The acpi code not only looks
> like crap because of that but it's buggy as hell now.

+1.

Len, acpi subsystem is old enough to live by kernel standards, and
important enough that it should look&feel like a kernel code. It also
does not seem to change quickly, so merging patches should not be a
big deal.
							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
