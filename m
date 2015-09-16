From: Chao Yu <chao2.yu@samsung.com>
Date: Wed, 16 Sep 2015 10:17:07 +0000
Subject: RE: [PATCH 37/39] f2fs crypto: drop null test before destroy functions
Message-Id: <000b01d0f068$f9695800$ec3c0800$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
	<1442146532-9100-38-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-38-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Julia Lawall' <Julia.Lawall@lip6.fr>, 'Jaegeuk Kim' <jaegeuk@kernel.org>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

> -----Original Message-----
> From: Julia Lawall [mailto:Julia.Lawall@lip6.fr]
> Sent: Sunday, September 13, 2015 8:16 PM
> To: Jaegeuk Kim
> Cc: sergey.senozhatsky@gmail.com; kernel-janitors@vger.kernel.org; Changman Lee; Chao Yu;
> linux-f2fs-devel@lists.sourceforge.net; linux-kernel@vger.kernel.org
> Subject: [PATCH 37/39] f2fs crypto: drop null test before destroy functions
> 
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Chao Yu <chao2.yu@samsung.com>

