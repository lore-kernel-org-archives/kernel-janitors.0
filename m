From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 11:30:13 +0000
Subject: Re: [PATCH] nfp: abm: fix a memory leak bug
Message-Id: <75768a26-836d-2aa5-94c8-6d8183745a9c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, netdev@vger.kernel.org, oss-drivers@netronome.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kangjie Lu <kjlu@umn.edu>

…
> Fix this issue by adding nfp_nsp_close(nsp) in the error path.

How do you think about a wording variant like the following?

   Subject:
   [PATCH v2] nfp: abm: Fix incomplete release of system resources in nfp_abm_vnic_set_mac()

   Change description:
   …
   Thus add a call of the function “nfp_nsp_close” for the completion
   of the exception handling.


…
> +++ b/drivers/net/ethernet/netronome/nfp/abm/main.c
> @@ -283,6 +283,7 @@  nfp_abm_vnic_set_mac(struct nfp_pf *pf, struct nfp_abm *abm, struct nfp_net *nn,
>  	if (!nfp_nsp_has_hwinfo_lookup(nsp)) {
>  		nfp_warn(pf->cpp, "NSP doesn't support PF MAC generation\n");
>  		eth_hw_addr_random(nn->dp.netdev);
> +		nfp_nsp_close(nsp);
>  		return;
>  	}

I suggest to reconsider the order for resource clean-up function calls
a bit more.

+		nfp_nsp_close(nsp);
-		eth_hw_addr_random(nn->dp.netdev);
-		return;
+		goto generate_random_address;


Should such a jump target be added in another update step?

Would you like to add the tag “Fixes”?

Regards,
Markus
