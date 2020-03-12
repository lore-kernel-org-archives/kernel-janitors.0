From: David Miller <davem@davemloft.net>
Date: Thu, 12 Mar 2020 22:51:13 +0000
Subject: Re: [PATCH] net: systemport: fix index check to avoid an array out of bounds access
Message-Id: <20200312.155113.707852640601289044.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312150430.1136618-1-colin.king@canonical.com>
In-Reply-To: <20200312150430.1136618-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Mar 2020 15:04:30 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the bounds check on index is off by one and can lead to
> an out of bounds access on array priv->filters_loc when index is
> RXCHK_BRCM_TAG_MAX.
> 
> Fixes: bb9051a2b230 ("net: systemport: Add support for WAKE_FILTER")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied and queued up for -stable, thanks.
