From: David Miller <davem@davemloft.net>
Date: Tue, 30 Apr 2019 15:04:25 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: fix buffer overflow doing set_rxnfc
Message-Id: <20190430.110425.1977792345336253148.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190430104419.GA9096@mwanda>
In-Reply-To: <20190430104419.GA9096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2019 13:44:19 +0300

> The "fs->location" is a u32 that comes from the user in ethtool_set_rxnfc().
> We can't pass unclamped values to test_bit() or it results in an out of
> bounds access beyond the end of the bitmap.
> 
> Fixes: 7318166cacad ("net: dsa: bcm_sf2: Add support for ethtool::rxnfc")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks Dan.
