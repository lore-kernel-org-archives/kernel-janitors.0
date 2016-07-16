From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 16 Jul 2016 05:45:39 +0000
Subject: Re: [patch] mtd: pmcmsp-flash: Allocating too much in init_msp_flash()
Message-Id: <20160716054539.GA20393@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714104456.GG18175@mwanda>
In-Reply-To: <20160714104456.GG18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marc St-Jean <stjeanma@pmc-sierra.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 14, 2016 at 01:44:56PM +0300, Dan Carpenter wrote:
> There is a cut and paste issue here.  The bug is that we are allocating
> more memory than necessary for msp_maps.  We should be allocating enough
> space for a map_info struct (144 bytes) but we instead allocate enough
> for an mtd_info struct (1840 bytes).  It's a small waste.
> 
> The other part of this is not harmful but when we allocated msp_flash
> then we allocated enough space fro a map_info pointer instead of an
> mtd_info pointer.  But since pointers are the same size it works out
> fine.
> 
> Anyway, I decided to clean up all three allocations a bit to make them
> a bit more consistent and clear.
> 
> Fixes: 68aa0fa87f6d ('[MTD] PMC MSP71xx flash/rootfs mappings')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git.
