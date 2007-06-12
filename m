From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Date: Tue, 12 Jun 2007 18:53:07 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <200706121253.07395.bjorn.helgaas@hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de> <200706101544.35463.bjorn.helgaas@hp.com> <200706122041.06252.lists-receive@programmierforen.de>
In-Reply-To: <200706122041.06252.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Drebes <lists-receive@programmierforen.de>
Cc: Pavel Machek <pavel@ucw.cz>, Christoph Hellwig <hch@infradead.org>, Len Brown <lenb@kernel.org>, kernel-janitors@lists.osdl.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 12 June 2007 12:41:05 pm Andi Drebes wrote:
> First off: sorry for my late answer.
> 
> > I agree the ACPI CA is a nuisance.  But in this case, we're making
> > a mountain out of a molehill.  I suspect that if somebody spent the
> > 15 minutes to make the ARRAY_SIZE patch work in both the Linux ACPI CA
> > and the generic Intel one and license it appropriately, Len would
> > happily apply the patch.
> I hope I got everything right. Here's what I understood so far:
> 
> The ACPI Subsystem in the kernel is derived from intel sources. I searched
> the web for information about that and finally found
> 
> http://www.intel.com/technology/iapc/acpi/downloads.htm
> 
> Is that the right one? So what I would have to do in order to
> "make the ARRAY_SIZE patch work in both the Linux ACPI CA
> and the generic Intel one" is to modify those sources aswell,
> send a patch to Intel and another one back to the
> lkml.

You found the right one.  The ACPI CA in Linux is really the same
as the one from Intel.  Len integrates the Intel one into Linux
periodically.  He uses scripts or something to format it so it looks
more like Linux.

I think Len sometimes takes patches against the "Linux-ized" ACPI CA.
He probably has to apply those by hand to the Intel one, which is
the real "upstream" in this case.  So it might be a bit easier for
him if you generated a diff against the Intel version.  Then it
would show up in Linux, too, in the fullness of time.

In any event, you want to end up with one patch, not two.

You probably would have to add something like:

  #ifndef ARRAY_SIZE
  #define ARRAY_SIZE(x) ...
  #endif

somewhere in the ACPI CA header files.  That way it will work in
non-Linux OSes as well.

Bjorn
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
