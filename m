From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 14 Aug 2018 13:42:32 +0000
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: missing unlock on error path
Message-Id: <20180814134232.GC2211@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090905.rm6i665c5utl7d32@kili.mountain>
In-Reply-To: <20180814090905.rm6i665c5utl7d32@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2018 at 12:09:05PM +0300, Dan Carpenter wrote:
> We added a new error path, but we need to drop the lock before we return.
> 
> Fixes: 2d2e1dd29962 ("net: dsa: mv88e6xxx: Cache the port cmode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
