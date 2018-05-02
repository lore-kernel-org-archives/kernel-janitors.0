From: Shawn Guo <shawnguo@kernel.org>
Date: Wed, 02 May 2018 08:52:22 +0000
Subject: Re: [PATCH 50/61] thermal: simplify getting .drvdata
Message-Id: <20180502085221.GH3443@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-51-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-51-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Apr 19, 2018 at 04:06:20PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/thermal/rockchip_thermal.c | 8 +++-----
>  drivers/thermal/spear_thermal.c    | 8 +++-----
>  drivers/thermal/zx2967_thermal.c   | 6 ++----
>  3 files changed, 8 insertions(+), 14 deletions(-)

For zx2967_thermal,

Acked-by: Shawn Guo <shawnguo@kernel.org>
