From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Mon, 25 Jan 2010 17:14:36 +0000
Subject: Re: [Drbd-dev] [patch] drbd: null dereference bug
Message-Id: <201001251814.37009.philipp.reisner@linbit.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100123124522.GA3061@bicker>
In-Reply-To: <20100123124522.GA3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: drbd-dev@lists.linbit.com
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>

Am Samstag, 23. Januar 2010 13:45:22 schrieb Dan Carpenter:
> epoch is always NULL here.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This patch has only been compile tested.  Sorry.  :/
>=20
> --- orig/drivers/block/drbd/drbd_receiver.c	2010-01-23 10:53:13.000000000
>  +0300 +++ devel/drivers/block/drbd/drbd_receiver.c	2010-01-23
>  10:54:19.000000000 +0300 @@ -1224,7 +1224,7 @@ static int
>  receive_Barrier(struct drbd_c
>  	epoch =3D kmalloc(sizeof(struct drbd_epoch), GFP_NOIO);
>  	if (!epoch) {
>  		dev_warn(DEV, "Allocation of an epoch failed, slowing down\n");
> -		issue_flush =3D !test_and_set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &ep=
och->flags);
> +		issue_flush =3D !test_and_set_bit(DE_BARRIER_IN_NEXT_EPOCH_ISSUED, &md=
ev->current_epoch->flags);
>  		drbd_wait_ee_list_empty(mdev, &mdev->active_ee);
>  		if (issue_flush) {
>  			rv =3D drbd_flush_after_epoch(mdev, mdev->current_epoch);
>

The patch is correct. It is going upstream though the DRBD tree.
See:
http://git.drbd.org/?p=3Dlinux-2.6-drbd.git;a=3Dcommit;h=D3db7b485ad7c467a6=
1279d6a8ef51a3c83352df

-Phil
--=20
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
