From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 24 Oct 2006 18:09:48 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/pci/
Message-Id: <20061024180948.GQ25210@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2006 at 09:51:23PM +0400, Alexey Dobriyan wrote:
> On Tue, Oct 24, 2006 at 06:36:35PM +0200, walter harms wrote:
> > to add some cream you may like to use (i did not check the types):
> > ret = kmemdup(des, sizeof(*des), GFP_KERNEL);
> > that make it independet of the type.
> 
> When this was last discussed on l-k, it was shown that some prefer
> 
> 	sizeof(*p)
> 
> some
> 	sizeof(struct foo)
> 
> so patches to make one style dominant are not welcome.

Chapter 14 of CodingStyle says those other people are wrong.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
