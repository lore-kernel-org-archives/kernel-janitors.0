From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Date: Mon, 18 Jul 2016 05:52:42 +0000
Subject: Re: [patch] phy: phy-brcm-sata: fix a loop timeout
Message-Id: <CAL2FKYmZEBu7kuN_zbDBDRJxajPNv4JRt6CgD7XfG2oDrGBa9w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 21, 2016 at 2:07 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Since this loop is a post op then it means we end with "try = -1" but
> afterward we test for if it's zero.  Fix this by changing to a pre-op so
> we end on zero.

Thanks Dan. That should be pre-op.

Thnaks
Dhananjay
>
> Fixes: 024812889ad1 ('phy: Add SATA3 PHY support for Broadcom NSP SoC')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/phy/phy-brcm-sata.c b/drivers/phy/phy-brcm-sata.c
> index 18d6626..c86456f 100644
> --- a/drivers/phy/phy-brcm-sata.c
> +++ b/drivers/phy/phy-brcm-sata.c
> @@ -329,7 +329,7 @@ static int brcm_nsp_sata_init(struct brcm_sata_port *port)
>
>         /* Wait for pll_seq_done bit */
>         try = 50;
> -       while (try--) {
> +       while (--try) {
>                 val = brcm_sata_phy_rd(base, BLOCK0_REG_BANK,
>                                         BLOCK0_XGXSSTATUS);
>                 if (val & BLOCK0_XGXSSTATUS_PLL_LOCK)
