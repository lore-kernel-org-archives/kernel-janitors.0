From: David Miller <davem@davemloft.net>
Date: Sat, 08 Oct 2016 04:05:26 +0000
Subject: Re: [PATCH] wan/fsl_ucc_hdlc: Fix size used in dma_free_coherent()
Message-Id: <20161008.000526.415379645974882301.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475873927-14999-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1475873927-14999-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: qiang.zhao@nxp.com, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri,  7 Oct 2016 22:58:47 +0200

> Size used with 'dma_alloc_coherent()' and 'dma_free_coherent()' should be
> consistent.
> Here, the size of a pointer is used in dma_alloc... and the size of the
> pointed structure is used in dma_free...
> 
> This has been spotted with coccinelle, using the following script:
> ////////////////////
> @r@
> expression x0, x1, y0, y1, z0, z1, t0, t1, ret;
> @@
> 
> *   ret = dma_alloc_coherent(x0, y0, z0, t0);
>     ...
> *   dma_free_coherent(x1, y1, ret, t1);
> 
> 
> @script:python@
> y0 << r.y0;
> y1 << r.y1;
> 
> @@
> if y1.find(y0) = -1:
>  print "WARNING: sizes look different:  '%s'   vs   '%s'" % (y0, y1)
> ////////////////////
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good to me, applied, thanks.
