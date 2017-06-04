From: David Miller <davem@davemloft.net>
Date: Sun, 04 Jun 2017 23:55:49 +0000
Subject: Re: [PATCH][V2] net: phy: marvell: make some functions static
Message-Id: <20170604.195549.1999857552284832975.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170602141334.26506-1-colin.king@canonical.com>
In-Reply-To: <20170602141334.26506-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  2 Jun 2017 15:13:34 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> functions m88e1510_get_temp_critical, m88e1510_set_temp_critical and
> m88e1510_get_temp_alarm can be made static as they not need to be
> in global scope.
> 
> Cleans up sparse warnings:
>  "symbol 'm88e1510_get_temp_alarm' was not declared. Should it be static?"
>  "symbol 'm88e1510_get_temp_critical' was not declared. Should it be
>   static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
