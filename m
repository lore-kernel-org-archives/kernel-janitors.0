From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:12 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: remove redundant variable off
Message-Id: <20180704.224012.1981408053486794183.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704065436.13719-1-colin.king@canonical.com>
In-Reply-To: <20180704065436.13719-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 07:54:36 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'off' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'off' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
