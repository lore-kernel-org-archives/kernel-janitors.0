From: David Miller <davem@davemloft.net>
Date: Mon, 26 Feb 2018 16:34:05 +0000
Subject: Re: [PATCH] sfc: falcon: remove duplicated bit-wise or of LOOPBACK_SGMII
Message-Id: <20180226.113405.1105061701822631136.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223140056.27219-1-colin.king@canonical.com>
In-Reply-To: <20180223140056.27219-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 14:00:56 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Bit pattern LOOPBACK_SGMII is being bit-wise or'd twice; remove the
> redundant 2nd LOOPBACK_SGMII
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
