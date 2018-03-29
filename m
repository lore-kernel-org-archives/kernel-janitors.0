From: Joe Perches <joe@perches.com>
Date: Thu, 29 Mar 2018 13:01:25 +0000
Subject: Re: [PATCH] qed: fix a bunch of spelling mistakes/typos
Message-Id: <1522328485.2210.30.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180329124144.27841-1-colin.king@canonical.com>
In-Reply-To: <20180329124144.27841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2018-03-29 at 13:41 +0100, Colin King wrote:
> Trivial fix to spelling mistakes/typos in various DP_* messages.
[]
> diff --git a/drivers/net/ethernet/qlogic/qed/qed_vf.c b/drivers/net/ethernet/qlogic/qed/qed_vf.c
[]
> @@ -231,7 +231,7 @@ static void qed_vf_pf_acquire_reduce_resc(struct qed_hwfn *p_hwfn,
>  {
>  	DP_VERBOSE(p_hwfn,
>  		   QED_MSG_IOV,
> -		   "PF unwilling to fullill resource request: rxq [%02x/%02x] txq [%02x/%02x] sbs [%02x/%02x] mac [%02x/%02x] vlan [%02x/%02x] mc [%02x/%02x] cids [%02x/%02x]. Try PF recommended amount\n",
> +		   "PF unwilling to fulfil resource request: rxq [%02x/%02x] txq [%02x/%02x] sbs [%02x/%02x] mac [%02x/%02x] vlan [%02x/%02x] mc [%02x/%02x] cids [%02x/%02x]. Try PF recommended amount\n",

Substituting one typo for another

fulfil->fulfill

