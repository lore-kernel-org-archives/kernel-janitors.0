From: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 13 Jan 2016 22:09:23 +0000
Subject: Re: fsl/fman: Clarification for implementation details in dtsec_config()
Message-Id: <20160113220923.GE5527@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5696BFAD.9030905@users.sourceforge.net>
 <20160113213537.GD4399@mwanda>
In-Reply-To: <20160113213537.GD4399@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Igal Liberman <igal.liberman@freescale.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, Jan 14, 2016 at 12:35:37AM +0300, Dan Carpenter wrote:
> I think you can remove the put_device() line.

Agreed.

of_phy_find_device() only does a get_device() when it finds a matching
device.

	Andrew
