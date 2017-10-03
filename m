From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 03 Oct 2017 12:41:45 +0000
Subject: Re: [PATCH] net: dsa: lan9303: make functions lan9303_mdio_phy_{read|write} static
Message-Id: <20171003124145.GE13548@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003103918.26934-1-colin.king@canonical.com>
In-Reply-To: <20171003103918.26934-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 03, 2017 at 11:39:18AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions lan9303_mdio_phy_write and lan9303_mdio_phy_read are local
> to the source and do not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> symbol 'lan9303_mdio_phy_write' was not declared. Should it be static?
> symbol 'lan9303_mdio_phy_read' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
