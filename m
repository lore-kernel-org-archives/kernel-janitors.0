From: Timmy Yee <shoujun@masterofpi.org>
Date: Tue, 20 Jan 2004 15:20:19 +0000
Subject: Re: [Kernel-janitors] [PATCH] fix kmalloc() in aha1542.c
Message-Id: <20040120152019.GA3384@masterofpi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040119034853.GA15426@masterofpi.org>
In-Reply-To: <20040119034853.GA15426@masterofpi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 19, 2004 at 06:00:41PM +0800, Eugene Teo wrote:

> What do you mean called with no memtype?

GFP_DMA is a helper flag that tells the kernel that the memory should be
suitable for DMA purposes. But it doesn't necessarily say what type of
memory it should be allocating (i.e. should the memory be allocated on
behalf of the user? should the allocation be done atomically? etc).
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
