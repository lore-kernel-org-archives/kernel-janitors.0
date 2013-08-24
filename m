From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 24 Aug 2013 04:54:03 +0000
Subject: Re: [patch] mtd cs553x_nand: use kzalloc() instead of memset
Message-Id: <20130824045403.GB19575@brian-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823095145.GQ31293@elgon.mountain>
In-Reply-To: <20130823095145.GQ31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, Nathan Williams <nathan@traverse.com.au>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>

On Fri, Aug 23, 2013 at 12:51:45PM +0300, Dan Carpenter wrote:
> It's cleaner to use kzalloc() instead of zeroing out in a separate call
> to memset().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git. Thanks!

Brian
