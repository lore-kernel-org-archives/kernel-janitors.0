From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Sep 2020 16:50:04 +0000
Subject: Re: [PATCH] mtd: mtdconcat: map: remove redundant assignment to variable 'size'
Message-Id: <20200911165004.27501-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200910154451.752569-1-colin.king@canonical.com>
References: <20200910154451.752569-1-colin.king@canonical.com>
In-Reply-To: <20200910154451.752569-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2020-09-10 at 15:44:51 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'size' is being assigned the value zero that will never be
> read. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
