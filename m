From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 02 Jun 2017 14:00:14 +0000
Subject: Re: [PATCH] net: phy: marvell: make two functions static
Message-Id: <20170602140014.GK12261@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170602111424.31287-1-colin.king@canonical.com>
In-Reply-To: <20170602111424.31287-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 02, 2017 at 12:14:24PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> functions m88e1510_get_temp_critical and m88e1510_get_temp_alarm can be
> made static as they not need to be in global scope.
> 
> Cleans up sparse warnings:
>  "symbol 'm88e1510_get_temp_alarm' was not declared. Should it be static?"
>  "symbol 'm88e1510_get_temp_critical' was not declared. Should it be 
>   static?"

Hi Colin

What about m88e1510_get_temp_alarm()? That should also have a static.

Thanks
     Andrew
