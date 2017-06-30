From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jun 2017 08:10:00 +0000
Subject: Re: [PATCH] irqchip/irq-mvebu-gicp: allocate enough memory for spi_bitmap
Message-Id: <20170630101000.76720e98@windsurf.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630080049.xr7luy5dfqdrfb57@mwanda>
In-Reply-To: <20170630080049.xr7luy5dfqdrfb57@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello,

On Fri, 30 Jun 2017 11:00:49 +0300, Dan Carpenter wrote:
> BITS_TO_LONGS() gives us the number of longs we need, but we want to
> allocate the number of bytes.
> 
> Fixes: a68a63cb4dfc ("irqchip/irq-mvebu-gicp: Add new driver for Marvell GICP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks for spotting the mistake.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
