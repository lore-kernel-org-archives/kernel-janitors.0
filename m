From: Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 17 Jan 2017 13:54:50 +0000
Subject: Re: [PATCH] stmmac: add missing of_node_put
Message-Id: <3b6da79c-93aa-b3e4-a36d-15325873711d@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1484652201-20048-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1484652201-20048-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi

On 01/17/2017 12:23 PM, Julia Lawall wrote:
> The function stmmac_dt_phy provides several possibilities for initializing
> plat->mdio_node, all of which have the effect of increasing the reference
> count of the assigned value.  This field is not updated elsewhere, so the
> value is live until the end of the lifetime of plat (devm_allocated), just
> after the end of stmmac_remove_config_dt.  Thus, add an of_node_put on
> plat->mdio_node in stmmac_remove_config_dt.  It is possible that the field
> mdio_node is never initialized, but of_node_put is NULL-safe, so it is also
> safe to call of_node_put in that case.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 4daa8a3..460f94f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -409,6 +409,7 @@ void stmmac_remove_config_dt(struct platform_device *pdev,
>  	if (of_phy_is_fixed_link(np))
>  		of_phy_deregister_fixed_link(np);
>  	of_node_put(plat->phy_node);
> +	of_node_put(plat->mdio_node);
>  }
>  #else
>  struct plat_stmmacenet_data *
>

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

Thanks
Alex
