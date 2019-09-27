From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 14:06:40 +0000
Subject: Re: [PATCH] nfp: flower: fix memory leak in nfp_flower_spawn_vnic_reprs
Message-Id: <e20e4ea4-72c8-2e2e-1745-309fc6f6a57c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925190512.3404-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925190512.3404-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org, oss-drivers@netronome.com
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>, Frederik Lotter <frederik.lotter@netronome.com>, John Hurley <john.hurley@netronome.com>, Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>, Simon Horman <simon.horman@netronome.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> @@ -433,6 +435,7 @@ nfp_flower_spawn_vnic_reprs(struct nfp_app *app,
>  		err = nfp_repr_init(app, repr,
>  				    port_id, port, priv->nn->dp.netdev);
>  		if (err) {
> +			kfree(repr_priv);
>  			nfp_port_free(port);
>  			nfp_repr_free(repr);
>  			goto err_reprs_clean;

How do you think about to move common exception handling code
to the end of this function implementation by using another jump target?

Regards,
Markus
