From: David Miller <davem@davemloft.net>
Date: Sun, 19 Sep 2010 18:59:58 +0000
Subject: Re: [patch -next] rds: double unlock in rds_ib_cm_handle_connect()
Message-Id: <20100919.115958.246545861.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100918234259.GD6236@bicker>
In-Reply-To: <20100918234259.GD6236@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: andy.grover@oracle.com, zach.brown@oracle.com, julia@diku.dk, tj@kernel.org, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sun, 19 Sep 2010 01:42:59 +0200

> We unlock after we goto out.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
