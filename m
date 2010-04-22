From: Andy Grover <andy.grover@oracle.com>
Date: Thu, 22 Apr 2010 17:28:31 +0000
Subject: Re: [patch] rdma: potential ERR_PTR dereference
Message-Id: <4BD0873F.4050704@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422095527.GQ29647@bicker>
In-Reply-To: <20100422095527.GQ29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> In the original code, the "goto out" calls "rdma_destroy_id(cm_id);"
> That isn't needed here and would cause problems because "cm_id" is an 
> ERR_PTR.  The new code just returns directly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks, Dan.

Acked-by: Andy Grover <andy.grover@oracle.com>

-- Andy

