From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 17 Oct 2018 08:41:23 +0000
Subject: Re: [PATCH] xfs: Fix error code in 'xfs_ioc_getbmap()'
Message-Id: <20181017084123.GK16896@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181017062138.1721-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181017062138.1721-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: darrick.wong@oracle.com, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 17, 2018 at 08:21:38AM +0200, Christophe JAILLET wrote:
> In this function, once 'buf' has been allocated, we unconditionally
> return 0.
> However, 'error' is set to some error codes in several error handling
> paths.
> Before commit 232b51948b99 ("xfs: simplify the xfs_getbmap interface")
> this was not an issue because all error paths were returning directly,
> but now that some cleanup at the end may be needed, we must propagate the
> error code.
> 
> Fixes: 232b51948b99 ("xfs: simplify the xfs_getbmap interface")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
