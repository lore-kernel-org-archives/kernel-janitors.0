From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 14 Apr 2017 19:14:24 +0000
Subject: Re: [PATCH -next] net: phy: test the right variable in phy_write_mmd()
Message-Id: <20170414191424.GA17758@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170414191041.GA27478@mwanda>
In-Reply-To: <20170414191041.GA27478@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 14, 2017 at 10:10:41PM +0300, Dan Carpenter wrote:
> This is a copy and paste buglet.  We meant to test for ->write_mmd but
> we test for ->read_mmd.
> 
> Fixes: 1ee6b9bc6206 ("net: phy: make phy_(read|write)_mmd() generic MMD accessors")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

