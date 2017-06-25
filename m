From: David Miller <davem@davemloft.net>
Date: Sun, 25 Jun 2017 15:40:46 +0000
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: fix error code in mv88e6390_serdes_power()
Message-Id: <20170625.114046.640050293672272051.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623151703.stzh2ur3wizbylbi@mwanda>
In-Reply-To: <20170623151703.stzh2ur3wizbylbi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 18:17:04 +0300

> We're accidentally returning the wrong variable.  "cmode" is
> uninitialized at this point so it causes a static checker warning.
> 
> Fixes: 6335e9f2446b ("net: dsa: mv88e6xxx: mv88e6390X SERDES support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
