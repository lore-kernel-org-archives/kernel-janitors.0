From: Daniele Bellucci <bellucda@tiscali.it>
Date: Mon, 19 Jan 2004 12:37:15 +0000
Subject: Re: [Kernel-janitors] [PATCH] fix kmalloc() in aha1542.c
Message-Id: <20040119123715.GA2321@charlie.minidns.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040119034853.GA15426@masterofpi.org>
In-Reply-To: <20040119034853.GA15426@masterofpi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


|-		SCpnt->host_scribble = (unsigned char *) kmalloc(512, GFP_DMA);
|+		SCpnt->host_scribble = (unsigned char *) kmalloc(512, GFP_KERNEL | GFP_DMA);
| 		sgpnt = (struct scatterlist *) SCpnt->request_buffer;
| 		cptr = (struct chain *) SCpnt->host_scribble;

I didn't look to much at your patch but 
because you are at it can you please audit that kmalloc too?

tnx


-- 

Daniele.




"I could have made money this way, and perhaps amused myself writing code. 
But I knew that at the end of my career, I would look back on years of 
building walls to divide people, and feel I had spent my life making the 
world a worse place."                               
                                                          Richard Stallman

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
