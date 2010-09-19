From: David Miller <davem@davemloft.net>
Date: Sun, 19 Sep 2010 18:59:50 +0000
Subject: Re: [patch -next] rds: spin_lock_irq() is not nestable
Message-Id: <20100919.120007.28825179.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100918234414.GE6236@bicker>
In-Reply-To: <20100918234414.GE6236@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: andy.grover@oracle.com, zach.brown@oracle.com, chris.mason@oracle.com, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sun, 19 Sep 2010 01:44:14 +0200

> This is basically just a cleanup.  IRQs were disabled on the previous
> line so we don't need to do it again here.  In the current code IRQs
> would get turned on one line earlier than intended.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Also applied, thanks Dan.
