From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sat, 23 Nov 2019 00:40:41 +0000
Subject: Re: [PATCH] qed: remove redundant assignments to rc
Message-Id: <20191122164041.1819414b@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122233839.110620-1-colin.king@canonical.com>
In-Reply-To: <20191122233839.110620-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 22 Nov 2019 23:38:39 +0000, Colin King wrote:
> diff --git a/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c b/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
> index 7e0b795230b2..12fc5f3b5cb4 100644
> --- a/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
> +++ b/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
> @@ -331,7 +331,7 @@ int qed_sp_pf_start(struct qed_hwfn *p_hwfn,
>  	u8 sb_index = p_hwfn->p_eq->eq_sb_index;
>  	struct qed_spq_entry *p_ent = NULL;
>  	struct qed_sp_init_data init_data;
> -	int rc = -EINVAL;
> +	int rc;
>  	u8 page_cnt, i;
>  
>  	/* update initial eq producer */

I like the clean up but, the variables here are ordered longest 
to shortest, please don't break people's coding style :(
