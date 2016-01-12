From: David Miller <davem@davemloft.net>
Date: Tue, 12 Jan 2016 19:31:12 +0000
Subject: Re: [patch] mdio_bus: NULL dereference on allocation error
Message-Id: <20160112.143112.1804837472013389455.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160112093435.GD29804@mwanda>
In-Reply-To: <20160112093435.GD29804@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jan 2016 12:34:36 +0300

> If bus = kzalloc() fails then we end up dereferencing bus when we do
> "bus->irq[i] = PHY_POLL;".  The code is a little simpler if we reverse
> the NULL check and return directly on failure.
> 
> Fixes: e7f4dc3536a4 ('mdio: Move allocation of interrupts into core')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
