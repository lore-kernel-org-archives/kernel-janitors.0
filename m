From: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 10 Aug 2017 15:21:12 +0000
Subject: Re: [PATCH net-next] phylink: Fix an uninitialized variable bug
Message-Id: <20170810152112.GF24790@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809213550.rga6tlohagu2pm2y@mwanda>
In-Reply-To: <20170809213550.rga6tlohagu2pm2y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 10, 2017 at 12:35:50AM +0300, Dan Carpenter wrote:
> "ret" isn't necessarily initialized here.
> 
> Fixes: 9525ae83959b ("phylink: add phylink infrastructure")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
