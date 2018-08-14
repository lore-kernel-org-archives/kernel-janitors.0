From: David Miller <davem@davemloft.net>
Date: Tue, 14 Aug 2018 17:08:25 +0000
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: missing unlock on error path
Message-Id: <20180814.100825.1562962208475355418.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090905.rm6i665c5utl7d32@kili.mountain>
In-Reply-To: <20180814090905.rm6i665c5utl7d32@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 12:09:05 +0300

> We added a new error path, but we need to drop the lock before we return.
> 
> Fixes: 2d2e1dd29962 ("net: dsa: mv88e6xxx: Cache the port cmode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
