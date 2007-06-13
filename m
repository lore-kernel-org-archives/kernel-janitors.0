From: Andi Drebes <lists-receive@programmierforen.de>
Date: Wed, 13 Jun 2007 21:21:38 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi: sizeof/sizeof array size calculations
Message-Id: <200706132321.39440.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200705261239.27485.lists-receive@programmierforen.de> <200706122041.06252.lists-receive@programmierforen.de> <200706121253.07395.bjorn.helgaas@hp.com>
In-Reply-To: <200706121253.07395.bjorn.helgaas@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Cc: Pavel Machek <pavel@ucw.cz>, Christoph Hellwig <hch@infradead.org>, Len Brown <lenb@kernel.org>, kernel-janitors@lists.osdl.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

<snip>
> You found the right one.  The ACPI CA in Linux is really the same
> as the one from Intel.  Len integrates the Intel one into Linux
> periodically.  He uses scripts or something to format it so it looks
> more like Linux.
Ok. That's what I thought so far.

> I think Len sometimes takes patches against the "Linux-ized" ACPI CA.
> He probably has to apply those by hand to the Intel one, which is
> the real "upstream" in this case.  So it might be a bit easier for
> him if you generated a diff against the Intel version. 
OK. I will do this in the next time.

> In any event, you want to end up with one patch, not two.
Ok. I thought of two patches because I didn't know how strong
the sources from the  ACPI CA are modified.

> You probably would have to add something like:
> 
>   #ifndef ARRAY_SIZE
>   #define ARRAY_SIZE(x) ...
>   #endif
> 
> somewhere in the ACPI CA header files.  That way it will work in
> non-Linux OSes as well.

Thanks so far,
	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
