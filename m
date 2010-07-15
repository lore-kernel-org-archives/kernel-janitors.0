From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 15 Jul 2010 21:21:16 +0000
Subject: Re: [PATCH 6/8] xfs: fix unsigned underflow
Message-Id: <20100715212116.GA7013@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219605-12631-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279219605-12631-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Dave Chinner <dchinner@redhat.com>, Felix Blyakher <felixb@sgi.com>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, xfs-masters@oss.sgi.com, Alex Elder <aelder@sgi.com>, Christoph Hellwig <hch@lst.de>

On Thu, Jul 15, 2010 at 10:46:45PM +0400, Kulikov Vasiliy wrote:
> map_len is unsigned. Checking map_len <= 0 is buggy when it should be
> below zero. So, check exact expression instead of map_len.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Looks good,


Reviewed-by: Christoph Hellwig <hch@lst.de>

