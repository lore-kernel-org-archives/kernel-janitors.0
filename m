From: David Miller <davem@davemloft.net>
Date: Tue, 12 Nov 2019 19:32:07 +0000
Subject: Re: [PATCH][next] net: dsa: mv88e6xxx: fix broken if statement because of a stray semicolon
Message-Id: <20191112.113207.2302490162902408721.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191112130523.232461-1-colin.king@canonical.com>
In-Reply-To: <20191112130523.232461-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, irtimmer@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Nov 2019 13:05:23 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a stray semicolon in an if statement that will cause a dev_err
> message to be printed unconditionally. Fix this by removing the stray
> semicolon.
> 
> Addresses-Coverity: ("Stay semicolon")
> Fixes: f0942e00a1ab ("net: dsa: mv88e6xxx: Add support for port mirroring")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
