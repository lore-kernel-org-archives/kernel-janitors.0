From: Eric Sesterhenn / Snakebyte <snakebyte@gmx.de>
Date: Tue, 24 Oct 2006 14:53:41 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/pci/
Message-Id: <20061024145341.GA12877@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

* Alexey Dobriyan (adobriyan@gmail.com) wrote:
> On Mon, Oct 23, 2006 at 10:22:57PM +0200, Eric Sesterhenn wrote:
> > replace open coded kmemdup() to save some screen space,
> > and allow inlining/not inlining to be triggered by gcc.
> 
> Patches are OK, btw what inlining/non inlining you are referring too?

the -O3 -Os compiler flags, where gcc might make the inlining
decission accordingly.

Greetings, Eric

-- 
 www.cobra-basket.de -- just my stuff
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
