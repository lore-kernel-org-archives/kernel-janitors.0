From: David Miller <davem@davemloft.net>
Date: Thu, 25 Oct 2018 18:36:16 +0000
Subject: Re: [PATCH] octeontx2-af: Use GFP_ATOMIC under spin lock
Message-Id: <20181025.113616.181038522357449184.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540431746-176759-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1540431746-176759-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 25 Oct 2018 01:42:26 +0000

> The function nix_update_mce_list() is called from
> nix_update_bcast_mce_list(), and a spin lock is held
> here, so we should use GFP_ATOMIC instead.
> 
> Fixes: 4b05528ebf0c ("octeontx2-af: Update bcast list upon NIXLF alloc/free")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I'm applying this.

I'm really disappointed in how the octeontx2 driver submission has done.

The Intel folks can get an entire new driver in with 2 series
of patches, we're on the 3rd or 4th here and the driver still
isn't completely enough to have basic functionality working.

This driver is huge, overly complicated, and is being submitted in a
very painful way.
