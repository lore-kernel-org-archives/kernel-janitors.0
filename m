From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 20:25:27 +0000
Subject: Re: [PATCH v2] nfp: abm: Fix incomplete release of system resources in nfp_abm_vnic_set_mac()
Message-Id: <88eecbe4-89b3-2b4d-87c7-5487cf23cadb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503184220.6209-1-wu000273@umn.edu>
In-Reply-To: <20200503184220.6209-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, oss-drivers@netronome.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kangjie Lu <kjlu@umn.edu>

> … Thus add a call of the function
> “nfp_nsp_close” for the completion of the exception handling.

Thanks for your positive response.

I imagined that a small patch series would be more reasonable
than this direct change combination.


…
> +++ b/drivers/net/ethernet/netronome/nfp/abm/main.c
…
>  	ether_addr_copy(nn->dp.netdev->perm_addr, mac_addr);
> +
> +generate_random_address:
> +	eth_hw_addr_random(nn->dp.netdev);
> +	return;
>  }
…

Unfortunately, you interpreted my update suggestion in a questionable way
at this source code place.
I guess that the following code variant can be considered instead.

 	ether_addr_copy(nn->dp.netdev->perm_addr, mac_addr);
+	return;
+
+generate_random_address:
+	eth_hw_addr_random(nn->dp.netdev);
 }


Regards,
Markus
