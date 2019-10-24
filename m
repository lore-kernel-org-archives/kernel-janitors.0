From: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 24 Oct 2019 11:58:31 +0000
Subject: Re: [PATCH][next] net: dsa: fix dereference on ds->dev before null check error
Message-Id: <20191024115831.GA12631@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024103218.2592-1-colin.king@canonical.com>
In-Reply-To: <20191024103218.2592-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 24, 2019 at 11:32:18AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently ds->dev is dereferenced on the assignments of pdata and
> np before ds->dev is null checked, hence there is a potential null
> pointer dereference on ds->dev.  Fix this by assigning pdata and
> np after the ds->dev null pointer sanity check.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 7e99e3470172 ("net: dsa: remove dsa_switch_alloc helper")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
