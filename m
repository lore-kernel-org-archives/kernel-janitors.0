From: David Miller <davem@davemloft.net>
Date: Tue, 03 Oct 2017 17:20:30 +0000
Subject: Re: [PATCH] net: dsa: mt7530: make functions mt7530_phy_write static
Message-Id: <20171003.102030.1150001638629183371.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003104633.27151-1-colin.king@canonical.com>
In-Reply-To: <20171003104633.27151-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  3 Oct 2017 11:46:33 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function mt7530_phy_write is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warnings:
> symbol 'mt7530_phy_write' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
