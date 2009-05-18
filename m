From: Zhu Yi <yi.zhu@intel.com>
Date: Mon, 18 May 2009 01:38:16 +0000
Subject: Re: [PATCH 1/3] drivers/net: use dev_get_drvdata
Message-Id: <1242610696.24825.462.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905171128140.20440@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0905171128140.20440@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sun, 2009-05-17 at 17:28 +0800, Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Eliminate direct accesses to the driver_data field.
> cf 82ab13b26f15f49be45f15ccc96bfa0b81dfd015
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> struct device *dev;
> expression E;
> type T;
> @@
> 
> - dev->driver_data = (T)E
> + dev_set_drvdata(dev, E)
> 
> @@
> struct device *dev;
> type T;
> @@
> 
> - (T)dev->driver_data
> + dev_get_drvdata(dev)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Zhu Yi <yi.zhu@intel.com>

Thanks,
-yi

