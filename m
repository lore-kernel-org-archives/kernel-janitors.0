From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Thu, 04 Aug 2016 08:12:28 +0000
Subject: Re: [patch] fcoe: use kfree_skb() to free an skb
Message-Id: <20160804081228.ie7yuhi37bjlatrw@c203.arch.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804052756.GH775@mwanda>
In-Reply-To: <20160804052756.GH775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "James E.J. Bottomley" <jejb-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Martin K. Petersen" <martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fcoe-devel-s9riP+hp16TNLxjTenLetw@public.gmane.org, Johannes Thumshirn <jth-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Thu, Aug 04, 2016 at 08:27:56AM +0300, Dan Carpenter wrote:
> This should be doing kfree_skb() instead of kfree().
>=20
> Fixes: 9a6cf881df02 ('fcoe: implement FIP VLAN responder')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
> index a569c65..dcf3653 100644
> --- a/drivers/scsi/fcoe/fcoe_ctlr.c
> +++ b/drivers/scsi/fcoe/fcoe_ctlr.c
> @@ -2923,7 +2923,7 @@ static int fcoe_ctlr_vlan_recv(struct fcoe_ctlr *fi=
p, struct sk_buff *skb)
>  	mutex_unlock(&fip->ctlr_mutex);
> =20
>  drop:
> -	kfree(skb);
> +	kfree_skb(skb);
>  	return rc;
>  }
> =20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi Dan,

This was already sent by Wei Yongjun and is
https://patchwork.kernel.org/patch/9245273/. Should be queued in Martin's t=
ree
already.

Thanks,
	Johannes

--=20
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
