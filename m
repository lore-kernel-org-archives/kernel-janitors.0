From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 16 Jul 2016 00:32:09 +0000
Subject: Re: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-Id: <20160716003209.GC76613@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715110629.GB9258@mwanda>
In-Reply-To: <20160715110629.GB9258@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Frans Klaver <fransklaver@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org

+ stable

Hi Dan,

Patch looks good, but one question.

On Fri, Jul 15, 2016 at 02:06:30PM +0300, Dan Carpenter wrote:
> We check for NULL but then dereference "info->mtd" on the next line.
>=20
> Fixes: 72169755cf36 ('mtd: maps: sa1100-flash: show parent device in sysf=
s')

What am I supposed to do about tags like this? It appears that the
-stable folks have started taking patches with a 'Fixes' tag alone [0],
even though that's not mentioned in [1]. I ask because I strongly
suspect this patch doesn't fit the rules in [1] -- it quite likely has
only been compile tested; and it qualifies quite well as violating
bullet 4:

"""
 - It must fix a real bug that bothers people (not a, "This could be a
   problem..." type thing).
"""

So, I'd like to keep the tag, but I'd like to avoid having to NAK it in
the stable review process. (And really, I often don't care enough to
even do that. I believe there's a very low chance that something like
this would cause additional problems more than the original bug.)

Regards,
Brian

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-fl=
ash.c
> index 142fc3d..784c6e1 100644
> --- a/drivers/mtd/maps/sa1100-flash.c
> +++ b/drivers/mtd/maps/sa1100-flash.c
> @@ -230,8 +230,10 @@ static struct sa_info *sa1100_setup_mtd(struct platf=
orm_device *pdev,
> =20
>  		info->mtd =3D mtd_concat_create(cdev, info->num_subdev,
>  					      plat->name);
> -		if (info->mtd =3D NULL)
> +		if (info->mtd =3D NULL) {
>  			ret =3D -ENXIO;
> +			goto err;
> +		}
>  	}
>  	info->mtd->dev.parent =3D &pdev->dev;
> =20

[0] I haven't tried to prove that all patches with 'Fixes' tags go to
the -stable queue, but I know at least that this commit:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id;=
5394a3ccffbfa1d1d448d48742853a862822c4

ended up in v4.5.y here:

https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit=
/?id=800a0b8a973b4262c92c228043cd17455cdf1a15

and IIRC, there are plenty more like that.

[1] Documentation/stable_kernel_rules.txt
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
