From: David Miller <davem@davemloft.net>
Date: Sun, 19 Sep 2010 18:59:53 +0000
Subject: Re: [patch -next] rds: signedness bug
Message-Id: <20100919.115953.260073665.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100918234224.GC6236@bicker>
In-Reply-To: <20100918234224.GC6236@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: andy.grover@oracle.com, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sun, 19 Sep 2010 01:42:25 +0200

> In the original code if the copy_from_user() fails in rds_rdma_pages()
> then the error handling fails and we get a stack trace from kmalloc().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
