From: Michal Simek <michal.simek@xilinx.com>
Date: Fri, 20 Apr 2018 07:23:00 +0000
Subject: Re: [PATCH 59/61] watchdog: simplify getting .drvdata
Message-Id: <c8156dd1-5081-7ab6-6dce-fde367190ae9@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-60-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-60-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 19.4.2018 16:06, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/watchdog/cadence_wdt.c   | 6 ++----
>  drivers/watchdog/of_xilinx_wdt.c | 6 ++----

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

