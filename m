From: David Miller <davem@davemloft.net>
Date: Thu, 22 Apr 2010 22:57:54 +0000
Subject: Re: [patch] rdma: potential ERR_PTR dereference
Message-Id: <20100422.155754.233400086.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422095527.GQ29647@bicker>
In-Reply-To: <20100422095527.GQ29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: andy.grover@oracle.com, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 11:55:27 +0200

> In the original code, the "goto out" calls "rdma_destroy_id(cm_id);"
> That isn't needed here and would cause problems because "cm_id" is an 
> ERR_PTR.  The new code just returns directly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
