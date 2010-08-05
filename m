From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Thu, 05 Aug 2010 21:10:46 +0000
Subject: Re: [PATCH 8/42] drivers/net/ixgbe: Adjust confusing if indentation
Message-Id: <AANLkTim49t=xgQeFLeFaQGqKvr1MXt67nck+uiH-V62X@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052219010.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052219010.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Bruce Allan <bruce.w.allan@intel.com>, Alex Duyck <alexander.h.duyck@intel.com>, PJ Waskiewicz <peter.p.waskiewicz.jr@intel.com>, John Ronciak <john.ronciak@intel.com>, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 5, 2010 at 13:19, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Both ifs and assignments to autoc seem similar enough that they are both
> put in the if branch indicated by their indentation.
>
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r disable braces4@
> position p1,p2;
> statement S1,S2;
> @@
>
> (
> if (...) { ... }
> |
> if (...) S1@p1 S2@p2
> )
>
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
>
> if (p1[0].column = p2[0].column):
>  cocci.print_main("branch",p1)
>  cocci.print_secs("after",p2)
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> This changes the semantics and might be the wrong fix.  Not tested.
>
>  drivers/net/ixgbe/ixgbe_82599.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ixgbe/ixgbe_82599.c b/drivers/net/ixgbe/ixgbe_82599.c
> index 3e06a61..a5fcdce 100644
> --- a/drivers/net/ixgbe/ixgbe_82599.c
> +++ b/drivers/net/ixgbe/ixgbe_82599.c
> @@ -766,12 +766,13 @@ s32 ixgbe_setup_mac_link_82599(struct ixgbe_hw *hw,
>            link_mode = IXGBE_AUTOC_LMS_KX4_KX_KR_SGMII) {
>                /* Set KX4/KX/KR support according to speed requested */
>                autoc &= ~(IXGBE_AUTOC_KX4_KX_SUPP_MASK | IXGBE_AUTOC_KR_SUPP);
> -               if (speed & IXGBE_LINK_SPEED_10GB_FULL)
> +               if (speed & IXGBE_LINK_SPEED_10GB_FULL) {
>                        if (orig_autoc & IXGBE_AUTOC_KX4_SUPP)
>                                autoc |= IXGBE_AUTOC_KX4_SUPP;
>                        if ((orig_autoc & IXGBE_AUTOC_KR_SUPP) &&
>                            (hw->phy.smart_speed_active = false))
>                                autoc |= IXGBE_AUTOC_KR_SUPP;
> +               }
>                if (speed & IXGBE_LINK_SPEED_1GB_FULL)
>                        autoc |= IXGBE_AUTOC_KX_SUPP;
>        } else if ((pma_pmd_1g = IXGBE_AUTOC_1G_SFI) &&

Thanks Julia, I ave added the path to my queue.

-- 
Cheers,
Jeff
