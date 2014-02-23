From: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 23 Feb 2014 02:37:07 +0000
Subject: Re: [patch] mtd: nuc900_nand: NULL dereference in nuc900_nand_enable()
Message-Id: <20140223023707.GA16834@norris-Latitude-E6410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140217200308.GA9845@elgon.mountain>
In-Reply-To: <20140217200308.GA9845@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Feb 17, 2014 at 11:03:08PM +0300, Dan Carpenter wrote:
> Instead of writing to "nand->reg + REG_FMICSR" we write to "REG_FMICSR"
> which is NULL and not a valid register.
> 
> Fixes: 8bff82cbc308 ('mtd: add nand support for w90p910 (v2)')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.

Pushed to l2-mtd.git. Thanks!

Brian
