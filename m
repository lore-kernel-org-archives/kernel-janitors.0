From: David Miller <davem@davemloft.net>
Date: Wed, 08 May 2019 20:58:08 +0000
Subject: Re: [PATCH] net: dsa: sja1105: Don't return a negative in u8 sja1105_stp_state_get
Message-Id: <20190508.135808.610382717397984273.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508203225.13275-1-olteanv@gmail.com>
In-Reply-To: <20190508203225.13275-1-olteanv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: olteanv@gmail.com
Cc: dan.carpenter@oracle.com, f.fainelli@gmail.com, vivien.didelot@gmail.com, andrew@lunn.ch, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed,  8 May 2019 23:32:25 +0300

> Dan Carpenter says:
> 
> The patch 640f763f98c2: "net: dsa: sja1105: Add support for Spanning
> Tree Protocol" from May 5, 2019, leads to the following static
> checker warning:
> 
>         drivers/net/dsa/sja1105/sja1105_main.c:1073 sja1105_stp_state_get()
>         warn: signedness bug returning '(-22)'
> 
> The caller doesn't check for negative errors anyway.
> 
> Fixes: 640f763f98c2: ("net: dsa: sja1105: Add support for Spanning Tree Protocol")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied.
