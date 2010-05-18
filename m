From: Zhu Yi <yi.zhu@intel.com>
Date: Tue, 18 May 2010 01:26:52 +0000
Subject: Re: [PATCH 26/37] drivers/net/wireless/ipw2x00: Use kmemdup
Message-Id: <1274146012.27831.2484.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152320450.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152320450.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sun, 2010-05-16 at 05:21 +0800, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use kmemdup when some other buffer is immediately copied into the
> allocated region.
> 
> A simplified version of the semantic patch that makes this change is
> as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression from,to,size,flag;
> statement S;
> @@
> 
> -  to = \(kmalloc\|kzalloc\)(size,flag);
> +  to = kmemdup(from,size,flag);
>    if (to=NULL || ...) S
> -  memcpy(to, from, size);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk> 

Acked-by: Zhu Yi <yi.zhu@intel.com>

Thanks,
-yi

