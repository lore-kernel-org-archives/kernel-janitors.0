From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 14 May 2020 20:59:50 +0000
Subject: Re: [PATCH][next] net: dsa: felix: fix incorrect clamp calculation for burst
Message-Id: <CA+h21hpdw5aXLnS0VRnf1XWkseKY83pAoqvUuM09xAFLHyrqWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200514183302.16925-1-colin.king@canonical.com>
In-Reply-To: <20200514183302.16925-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Xiaoliang Yang <xiaoliang.yang_1@nxp.com>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Hi Colin,

On Thu, 14 May 2020 at 21:34, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently burst is clamping on rate and not burst, the assignment
> of burst from the clamping discards the previous assignment of burst.
> This looks like a cut-n-paste error from the previous clamping
> calculation on ramp.  Fix this by replacing ramp with burst.
>
> Addresses-Coverity: ("Unused value")
> Fixes: 0fbabf875d18 ("net: dsa: felix: add support Credit Based Shaper(CBS) for hardware offload")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/net/dsa/ocelot/felix_vsc9959.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
> index df4498c0e864..85e34d85cc51 100644
> --- a/drivers/net/dsa/ocelot/felix_vsc9959.c
> +++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
> @@ -1360,7 +1360,7 @@ static int vsc9959_qos_port_cbs_set(struct dsa_switch *ds, int port,
>         /* Burst unit is 4kB */
>         burst = DIV_ROUND_UP(cbs_qopt->hicredit, 4096);
>         /* Avoid using zero burst size */
> -       burst = clamp_t(u32, rate, 1, GENMASK(5, 0));
> +       burst = clamp_t(u32, burst, 1, GENMASK(5, 0));
>         ocelot_write_gix(ocelot,
>                          QSYS_CIR_CFG_CIR_RATE(rate) |
>                          QSYS_CIR_CFG_CIR_BURST(burst),
> --
> 2.25.1
>

Thanks!
-Vladimir
