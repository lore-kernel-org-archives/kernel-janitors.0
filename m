From: David Miller <davem@davemloft.net>
Date: Tue, 31 May 2016 18:53:18 +0000
Subject: Re: [patch] atm: iphase: off by one in rx_pkt()
Message-Id: <20160531.115318.1748170211000331540.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527103435.GB3255@mwanda>
In-Reply-To: <20160527103435.GB3255@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 May 2016 13:34:35 +0300

> The iadev->rx_open[] array holds "iadev->num_vc" pointers (this code
> assumes that pointers are 32 bits).  So the > here should be >= or else
> we could end up reading a garbage pointer from one element beyond the
> end of the array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
