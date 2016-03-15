From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 15 Mar 2016 07:26:03 +0000
Subject: Re: [patch] block-dev: checking for NULL instead of IS_ERR()
Message-Id: <20160315072603.GC11669@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160308120546.GB28684@mwanda>
In-Reply-To: <20160308120546.GB28684@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Shaohua Li <shli@fb.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 08, 2016 at 03:05:46PM +0300, Dan Carpenter wrote:
> This should be an IS_ERR() check.  mount_pseudo() returns error pointers
> and this function should return the error pointer to its caller as well.
> 
> Fixes: 3684aa7099e0 ('block-dev: enable writeback cgroup support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks fine.  Would be much nicer to simply pass possible flags as an
argument to mount_pseudo to avoid this whole dance..

Reviewed-by: Christoph Hellwig <hch@lst.de>
