From: David Miller <davem@davemloft.net>
Date: Tue, 12 Jan 2016 19:31:02 +0000
Subject: Re: [patch 2/2 -next] phy: remove an unneeded condition
Message-Id: <20160112.143102.310556950177714192.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160112093621.GF29804@mwanda>
In-Reply-To: <20160112093621.GF29804@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jan 2016 12:36:21 +0300

> It used to be that bus->irq was a pointer but after e7f4dc3536a4
> ('mdio: Move allocation of interrupts into core') it's an array inside
> the mdio struct, so it can never be NULL.  Let's remove the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
