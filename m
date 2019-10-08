From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Tue, 08 Oct 2019 19:13:20 +0000
Subject: Re: [PATCH] net: phy: mscc: make arrays static, makes object smaller
Message-Id: <20191008121320.59959133@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007120308.2392-1-colin.king@canonical.com>
In-Reply-To: <20191007120308.2392-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon,  7 Oct 2019 13:03:08 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrays on the stack but instead make them
> static. Makes the object code smaller by 1058 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   29879	   6144	      0	  36023	   8cb7	drivers/net/phy/mscc.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   28437	   6528	      0	  34965	   8895	drivers/net/phy/mscc.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
