From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 28 Sep 2006 13:14:52 +0000
Subject: Re: [KJ] [parisc-linux] [PATCH] ioremap balanced with iounmap for
Message-Id: <20060928131452.GA5017@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060928125815.GA3507@athena.road.mcmartin.ca>
In-Reply-To: <20060928125815.GA3507@athena.road.mcmartin.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 28, 2006 at 08:58:15AM -0400, Kyle McMartin wrote:
> On Thu, Sep 28, 2006 at 11:23:34AM +0530, Amol Lad wrote:
> > ioremap must be balanced by an iounmap and failing to do so can result
> > in a memory leak.
> > 
> 
> Looks ok. Will merge.

Actually, it shows some areas we need to do better.  It's an
improvement, but look at, eg, the error returns from elroy.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
