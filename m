From: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 15 Feb 2015 09:07:11 +0000
Subject: Re: [patch] mtd: hisilicon: && vs & typo
Message-Id: <20150215090711.GA8351@norris-Latitude-E6410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211102509.GB18515@mwanda>
In-Reply-To: <20150211102509.GB18515@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Zhou Wang <wangzhou1@hisilicon.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
> The intent was to mask away some bits here, not to test true or false.
> 
> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git. Thanks.

Brian
