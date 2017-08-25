From: Martyn Welch <martyn@welchs.me.uk>
Date: Fri, 25 Aug 2017 20:57:22 +0000
Subject: Re: [PATCH 13/14] vme: tsi148: Improve 17 size determinations
Message-Id: <20170825205721.GA11181@hades.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
 <1cb8956d-2862-9f64-d19c-32b4a797a3b1@users.sourceforge.net>
In-Reply-To: <1cb8956d-2862-9f64-d19c-32b4a797a3b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Aug 25, 2017 at 06:15:08PM +0200, SF Markus Elfring wrote:

<snip>

> @@ -2363,5 +2364,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		master_num--;
>  
>  		tsi148_device->flush_image > -			kmalloc(sizeof(struct vme_master_resource), GFP_KERNEL);
> +			kmalloc(sizeof(*tsi148_device->flush_image), GFP_KERNEL);

This line is now a tiny bit too long and needs to be broken over two lines.

Martyn
