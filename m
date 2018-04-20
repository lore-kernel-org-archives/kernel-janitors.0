From: Michal Simek <michal.simek@xilinx.com>
Date: Fri, 20 Apr 2018 07:23:41 +0000
Subject: Re: [PATCH 53/61] tty: serial: simplify getting .drvdata
Message-Id: <ce3c4fa9-c6bc-a529-3c91-9f353d017720@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-54-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-54-wsa+renesas@sang-engineering.com>
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
>  drivers/tty/serial/imx.c              | 18 ++++++------------
>  drivers/tty/serial/qcom_geni_serial.c |  6 ++----
>  drivers/tty/serial/st-asc.c           |  6 ++----
>  drivers/tty/serial/xilinx_uartps.c    |  6 ++----

Acked-by: Michal Simek <michal.simek@xilinx.com> (for xilinx)

Thanks,
Michal

