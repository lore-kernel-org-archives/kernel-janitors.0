From: Timmy Yee <shoujun@masterofpi.org>
Date: Tue, 20 Jan 2004 15:33:10 +0000
Subject: Re: [Kernel-janitors] [PATCH] fix kmalloc() in aha1542.c
Message-Id: <20040120153310.GB3384@masterofpi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040119034853.GA15426@masterofpi.org>
In-Reply-To: <20040119034853.GA15426@masterofpi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 19, 2004 at 01:37:15PM +0100, Daniele Bellucci wrote:
> 
> |-		SCpnt->host_scribble = (unsigned char *) kmalloc(512, GFP_DMA);
> |+		SCpnt->host_scribble = (unsigned char *) kmalloc(512, GFP_KERNEL | GFP_DMA);
> | 		sgpnt = (struct scatterlist *) SCpnt->request_buffer;
> | 		cptr = (struct chain *) SCpnt->host_scribble;
> 
> I didn't look to much at your patch but 
> because you are at it can you please audit that kmalloc too?

The address returned by kmalloc() seems to be checked three lines later.
Though it calls panic() if the address is NULL. I'm not sure if that's the
correct way to fail on an allocation.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
