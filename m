From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 02 Jun 2017 16:48:29 +0000
Subject: Re: [PATCH][V2] net: phy: marvell: make some functions static
Message-Id: <5268b842-3784-36f7-7c6f-e1b4b670f8b5@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170602141334.26506-1-colin.king@canonical.com>
In-Reply-To: <20170602141334.26506-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 06/02/2017 07:13 AM, Colin King wrote:
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

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
