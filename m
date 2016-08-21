From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Aug 2016 09:58:01 +0000
Subject: Re: [PATCH] staging/lustre/llite: Use memdup_user() rather than duplicating its implementation
Message-Id: <494e9b94-d3d4-3057-2619-5c3aca85a204@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <73da135c-be81-e915-9b7a-6773e730b4e7@users.sourceforge.net>
In-Reply-To: <73da135c-be81-e915-9b7a-6773e730b4e7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Le 21/08/2016 =E0 11:45, SF Markus Elfring a =E9crit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 Aug 2016 11:30:57 +0200
>
> Reuse existing functionality from memdup_user() instead of keeping
> duplicate source code.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/staging/lustre/lustre/llite/dir.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/staging/lustre/lustre/llite/dir.c b/drivers/staging/=
lustre/lustre/llite/dir.c
> index 031c9e4..8b70e42 100644
> --- a/drivers/staging/lustre/lustre/llite/dir.c
> +++ b/drivers/staging/lustre/lustre/llite/dir.c
> @@ -1676,14 +1676,9 @@ out_poll:
>   	case LL_IOC_QUOTACTL: {
>   		struct if_quotactl *qctl;
>  =20
> -		qctl =3D kzalloc(sizeof(*qctl), GFP_NOFS);
Same as previously reported in another patch, GFP_NOFS has not the same=20
meaning than GPF_KERNEL.
So your proposed clean-up is not 100% equivalent.

Are your sure that GPF_KERNEL instead of GFP_NOFS is right in this code?

Maybe, the coccinelle check should be tweak to only spot "kzalloc(...,=20
GFP_KERNEL)" allocation?

> -		if (!qctl)
> -			return -ENOMEM;
> -
> -		if (copy_from_user(qctl, (void __user *)arg, sizeof(*qctl))) {
> -			rc =3D -EFAULT;
> -			goto out_quotactl;
> -		}
> +		qctl =3D memdup_user((void __user *)arg, sizeof(*qctl));
> +		if (IS_ERR(qctl))
> +			return PTR_ERR(qctl);
>  =20
>   		rc =3D quotactl_ioctl(sbi, qctl);
>  =20
> @@ -1691,7 +1686,6 @@ out_poll:
>   					    sizeof(*qctl)))
>   			rc =3D -EFAULT;
>  =20
> -out_quotactl:
>   		kfree(qctl);
>   		return rc;
>   	}



---
L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=E9e p=
ar le logiciel antivirus Avast.
https://www.avast.com/antivirus


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
