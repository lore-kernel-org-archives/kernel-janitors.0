From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 21 Oct 2020 04:00:05 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: make const array static, makes object smaller
Message-Id: <20201020210005.7871ff74@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201020165029.56383-1-colin.king@canonical.com>
        <0cdc86a4-66a0-2f1f-ba23-03b54ccacd69@gmail.com>
In-Reply-To: <0cdc86a4-66a0-2f1f-ba23-03b54ccacd69@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 20 Oct 2020 09:51:39 -0700 Florian Fainelli wrote:
> On 10/20/20 9:50 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Don't populate the const array rate_table on the stack but instead it
> > static. Makes the object code smaller by 46 bytes.
> > 
> > Before:
> >    text	   data	    bss	    dec	    hex	filename
> >   29812	   3824	    192	  33828	   8424	drivers/net/dsa/bcm_sf2.o
> > 
> > After:
> >    text	   data	    bss	    dec	    hex	filename
> >   29670	   3920	    192	  33782	   83f6	drivers/net/dsa/bcm_sf2.o
> > 
> > (gcc version 10.2.0)
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Applied, thanks!
