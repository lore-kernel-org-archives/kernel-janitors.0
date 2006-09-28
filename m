From: Kyle McMartin <kyle@parisc-linux.org>
Date: Thu, 28 Sep 2006 12:58:15 +0000
Subject: Re: [KJ] [parisc-linux] [PATCH] ioremap balanced with iounmap for
Message-Id: <20060928125815.GA3507@athena.road.mcmartin.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 28, 2006 at 11:23:34AM +0530, Amol Lad wrote:
> ioremap must be balanced by an iounmap and failing to do so can result
> in a memory leak.
> 

Looks ok. Will merge.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
