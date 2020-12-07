From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 07 Dec 2020 11:09:25 +0000
Subject: Re: [PATCH] mtd: rawnand: meson: Fix a resource leak in init
Message-Id: <20201207110926.7951-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <X8ikVCnUsfTpffFB@mwanda>
References: <X8ikVCnUsfTpffFB@mwanda>
In-Reply-To: <X8ikVCnUsfTpffFB@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liang Yang <liang.yang@amlogic.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Vignesh Raghavendra <vigneshr@ti.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>

On Thu, 2020-12-03 at 08:39:48 UTC, Dan Carpenter wrote:
> Call clk_disable_unprepare(nfc->phase_rx) if the clk_set_rate() function
> fails to avoid a resource leak.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
