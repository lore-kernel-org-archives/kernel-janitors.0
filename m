From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sun, 22 Sep 2019 02:43:52 +0000
Subject: Re: [PATCH net] net: dsa: sja1105: Add dependency for NET_DSA_SJA1105_TAS
Message-Id: <20190921194352.1500a70d@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190919063819.164826-1-maowenan@huawei.com>
In-Reply-To: <20190919063819.164826-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: olteanv@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 19 Sep 2019 14:38:19 +0800, Mao Wenan wrote:
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

Applied, thank you!
