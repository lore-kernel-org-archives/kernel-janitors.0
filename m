From: David Miller <davem@davemloft.net>
Date: Mon, 17 Apr 2017 19:11:01 +0000
Subject: Re: [PATCH -next] net: phy: test the right variable in phy_write_mmd()
Message-Id: <20170417.151101.1654282192272824268.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170414191041.GA27478@mwanda>
In-Reply-To: <20170414191041.GA27478@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, rmk+kernel@armlinux.org.uk, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Apr 2017 22:10:41 +0300

> This is a copy and paste buglet.  We meant to test for ->write_mmd but
> we test for ->read_mmd.
> 
> Fixes: 1ee6b9bc6206 ("net: phy: make phy_(read|write)_mmd() generic MMD accessors")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
