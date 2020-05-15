From: David Miller <davem@davemloft.net>
Date: Fri, 15 May 2020 01:03:22 +0000
Subject: Re: [PATCH][next] net: dsa: felix: fix incorrect clamp calculation for burst
Message-Id: <20200514.180322.2120900678402639632.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200514183302.16925-1-colin.king@canonical.com>
In-Reply-To: <20200514183302.16925-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, xiaoliang.yang_1@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 14 May 2020 19:33:02 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently burst is clamping on rate and not burst, the assignment
> of burst from the clamping discards the previous assignment of burst.
> This looks like a cut-n-paste error from the previous clamping
> calculation on ramp.  Fix this by replacing ramp with burst.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 0fbabf875d18 ("net: dsa: felix: add support Credit Based Shaper(CBS) for hardware offload")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
