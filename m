From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 04 Jan 2021 10:18:20 +0000
Subject: Re: [PATCH] mtd: remove redundant assignment to pointer eb
Message-Id: <20210104101821.2969-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200911102321.22515-1-colin.king@canonical.com>
References: <20200911102321.22515-1-colin.king@canonical.com>
In-Reply-To: <20200911102321.22515-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2020-09-11 at 10:23:21 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer eb is being assigned a value that is never read, the assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
