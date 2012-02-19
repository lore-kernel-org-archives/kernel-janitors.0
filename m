From: David Miller <davem@davemloft.net>
Date: Sun, 19 Feb 2012 23:58:42 +0000
Subject: Re: [patch] net/ethernet: ks8851_mll: signedness bug in ks8851_probe()
Message-Id: <20120219.185842.2291224018268083016.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120217064433.GC3666@elgon.mountain>
In-Reply-To: <20120217064433.GC3666@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: j.weitzel@phytec.de, adobriyan@gmail.com, paul.gortmaker@windriver.com, thomas@m3y3r.de, danny.kukawka@bisect.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Feb 2012 09:44:33 +0300

> netdev->irq is unsigned, so it's never less than zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
