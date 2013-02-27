From: David Miller <davem@davemloft.net>
Date: Wed, 27 Feb 2013 18:12:17 +0000
Subject: Re: [patch] irda: small read beyond end of array in debug code
Message-Id: <20130227.131217.1331086829065132895.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130227051502.GC22703@longonot.mountain>
In-Reply-To: <20130227051502.GC22703@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: samuel@sortiz.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Feb 2013 08:15:02 +0300

> charset comes from skb->data.  It's a number in the 0-255 range.
> If we have debugging turned on then this could cause a read beyond
> the end of the array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
