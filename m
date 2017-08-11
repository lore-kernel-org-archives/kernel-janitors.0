From: David Miller <davem@davemloft.net>
Date: Fri, 11 Aug 2017 20:58:25 +0000
Subject: Re: [PATCH net-next] phylink: Fix an uninitialized variable bug
Message-Id: <20170811.135825.69794999824395524.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170809213550.rga6tlohagu2pm2y@mwanda>
In-Reply-To: <20170809213550.rga6tlohagu2pm2y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, rmk+kernel@arm.linux.org.uk, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 00:35:50 +0300

> "ret" isn't necessarily initialized here.
> 
> Fixes: 9525ae83959b ("phylink: add phylink infrastructure")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
