From: Jens Axboe <axboe@kernel.dk>
Date: Tue, 07 Apr 2020 20:49:58 +0000
Subject: Re: [PATCH] ata: ahci-imx: remove redundant assignment to ret
Message-Id: <ac93c383-fdc3-a818-9e3b-faed462c31e5@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200405115120.366864-1-colin.king@canonical.com>
In-Reply-To: <20200405115120.366864-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/5/20 4:51 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe
