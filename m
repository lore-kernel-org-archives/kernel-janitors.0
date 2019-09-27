From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 14:26:28 +0000
Subject: Re: [PATCH] nfp: flower: prevent memory leak in nfp_flower_spawn_phy_reprs
Message-Id: <95ee54a0-a5ff-a9f0-0d87-471e0f1f790c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925182405.31287-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925182405.31287-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org, oss-drivers@netronome.com
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Frederik Lotter <frederik.lotter@netronome.com>, John Hurley <john.hurley@netronome.com>, Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>, Simon Horman <simon.horman@netronome.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In nfp_flower_spawn_phy_reprs, in the for loop over eth_tbl if any of
> intermediate allocations or initializations fail memory is leaked.
> requiered releases are added.

I suggest to improve also this change description.


> @@ -542,6 +545,7 @@ nfp_flower_spawn_phy_reprs(struct nfp_app *app, struct nfp_flower_priv *priv)
>  		err = nfp_repr_init(app, repr,
>  				    cmsg_port_id, port, priv->nn->dp.netdev);
>  		if (err) {
> +			kfree(repr_priv);
>  			nfp_port_free(port);
>  			nfp_repr_free(repr);
>  			goto err_reprs_clean;

How do you think about to move common exception handling code
to the end of this function implementation by adding jump targets?

Regards,
Markus
