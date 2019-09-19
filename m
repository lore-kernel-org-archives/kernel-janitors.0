From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 19 Sep 2019 06:25:21 +0000
Subject: Re: [PATCH net] net: dsa: sja1105: Add dependency for NET_DSA_SJA1105_TAS
Message-Id: <CA+h21hqjrt2qcCAFosOC61QcsiHS1TYaR6u=SjMMFH8W+ZZYug@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190919063819.164826-1-maowenan@huawei.com>
In-Reply-To: <20190919063819.164826-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, lkml <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 19 Sep 2019 at 09:22, Mao Wenan <maowenan@huawei.com> wrote:
>
> If CONFIG_NET_DSA_SJA1105_TAS=y and CONFIG_NET_SCH_TAPRIO=n,
> below error can be found:
> drivers/net/dsa/sja1105/sja1105_tas.o: In function `sja1105_setup_tc_taprio':
> sja1105_tas.c:(.text+0x318): undefined reference to `taprio_offload_free'
> sja1105_tas.c:(.text+0x590): undefined reference to `taprio_offload_get'
> drivers/net/dsa/sja1105/sja1105_tas.o: In function `sja1105_tas_teardown':
> sja1105_tas.c:(.text+0x610): undefined reference to `taprio_offload_free'
> make: *** [vmlinux] Error 1
>
> sja1105_tas needs tc-taprio, so this patch add the dependency for it.
>
> Fixes: 317ab5b86c8e ("net: dsa: sja1105: Configure the Time-Aware Scheduler via tc-taprio offload")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  drivers/net/dsa/sja1105/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/dsa/sja1105/Kconfig b/drivers/net/dsa/sja1105/Kconfig
> index 55424f3..f40b248 100644
> --- a/drivers/net/dsa/sja1105/Kconfig
> +++ b/drivers/net/dsa/sja1105/Kconfig
> @@ -27,6 +27,7 @@ config NET_DSA_SJA1105_PTP
>  config NET_DSA_SJA1105_TAS
>         bool "Support for the Time-Aware Scheduler on NXP SJA1105"
>         depends on NET_DSA_SJA1105
> +       depends on NET_SCH_TAPRIO
>         help
>           This enables support for the TTEthernet-based egress scheduling
>           engine in the SJA1105 DSA driver, which is controlled using a
> --
> 2.7.4
>

Thanks!
-Vladimir
