From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 12 Nov 2019 13:27:28 +0000
Subject: Re: [PATCH][next] net: dsa: mv88e6xxx: fix broken if statement because of a stray semicolon
Message-Id: <20191112132728.GC5090@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191112130523.232461-1-colin.king@canonical.com>
In-Reply-To: <20191112130523.232461-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Iwan R Timmer <irtimmer@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 12, 2019 at 01:05:23PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a stray semicolon in an if statement that will cause a dev_err
> message to be printed unconditionally. Fix this by removing the stray
> semicolon.
> 
> Addresses-Coverity: ("Stay semicolon")
> Fixes: f0942e00a1ab ("net: dsa: mv88e6xxx: Add support for port mirroring")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
