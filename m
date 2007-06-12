From: Andi Drebes <lists-receive@programmierforen.de>
Date: Tue, 12 Jun 2007 18:41:05 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <200706122041.06252.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de> <20070610105712.GA4695@ucw.cz> <200706101544.35463.bjorn.helgaas@hp.com>
In-Reply-To: <200706101544.35463.bjorn.helgaas@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Christoph Hellwig <hch@infradead.org>, Len Brown <lenb@kernel.org>, kernel-janitors@lists.osdl.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

First off: sorry for my late answer.

> I agree the ACPI CA is a nuisance.  But in this case, we're making
> a mountain out of a molehill.  I suspect that if somebody spent the
> 15 minutes to make the ARRAY_SIZE patch work in both the Linux ACPI CA
> and the generic Intel one and license it appropriately, Len would
> happily apply the patch.
I hope I got everything right. Here's what I understood so far:

The ACPI Subsystem in the kernel is derived from intel sources. I searched
the web for information about that and finally found

http://www.intel.com/technology/iapc/acpi/downloads.htm

Is that the right one? So what I would have to do in order to
"make the ARRAY_SIZE patch work in both the Linux ACPI CA
and the generic Intel one" is to modify those sources aswell,
send a patch to Intel and another one back to the
lkml.

Is that right? Or am I totally wrong?

	Cheers,
		Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
