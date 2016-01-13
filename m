From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jan 2016 21:35:37 +0000
Subject: Re: fsl/fman: Clarification for implementation details in dtsec_config()
Message-Id: <20160113213537.GD4399@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5696BFAD.9030905@users.sourceforge.net>
In-Reply-To: <5696BFAD.9030905@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Igal Liberman <igal.liberman@freescale.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

I think you can remove the put_device() line.

regards,
dan carpenter

