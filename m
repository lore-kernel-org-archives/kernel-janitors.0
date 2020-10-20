From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 20 Oct 2020 16:51:39 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: make const array static, makes object smaller
Message-Id: <0cdc86a4-66a0-2f1f-ba23-03b54ccacd69@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201020165029.56383-1-colin.king@canonical.com>
In-Reply-To: <20201020165029.56383-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/20/20 9:50 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array rate_table on the stack but instead it
> static. Makes the object code smaller by 46 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   29812	   3824	    192	  33828	   8424	drivers/net/dsa/bcm_sf2.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   29670	   3920	    192	  33782	   83f6	drivers/net/dsa/bcm_sf2.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
