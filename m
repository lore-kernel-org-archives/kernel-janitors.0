From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 15:04:45 +0000
Subject: Re: [PATCH] i40e: prevent memory leak in i40e_setup_macvlans
Message-Id: <8d7d8cf4-c016-d22c-c2cc-dc71ea407cb4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925154831.19044-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925154831.19044-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Jeffrey Kirsher <jeffrey.t.kirsher@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In i40e_setup_macvlans if i40e_setup_channel fails the allocated memory
> for ch should be released.

I suggest to improve also this change description.


> +++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
> @@ -7168,6 +7168,7 @@ static int i40e_setup_macvlans(struct i40e_vsi *vsi, u16 macvlan_cnt, u16 qcnt,
>  		ch->num_queue_pairs = qcnt;
>  		if (!i40e_setup_channel(pf, vsi, ch)) {
>  			ret = -EINVAL;
> +			kfree(ch);
>  			goto err_free;
>  		}
>  		ch->parent_vsi = vsi;

Can it matter to perform the added function call before the error code assignment?

Regards,
Markus
