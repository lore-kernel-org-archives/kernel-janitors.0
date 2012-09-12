From: Marcos Souza <marcos.souza.org@gmail.com>
Date: Wed, 12 Sep 2012 13:34:01 +0000
Subject: Re: [PATCH v2 7/8] drivers/media/platform/davinci/vpbe.c: Removes useless kfree()
Message-Id: <CAH0vN5+ZoexHtmgyZ+s9tiW3LYx+6PMT8aLyYt-T5mnaGXvYbQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347454564-5178-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347454564-5178-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

2012/9/12 Peter Senna Tschudin <peter.senna@gmail.com>:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Remove useless kfree() and clean up code related to the removal.
>
> The semantic patch that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r exists@
> position p1,p2;
> expression x;
> @@
>
> if (x@p1 =3D NULL) { ... kfree@p2(x); ... return ...; }
>
> @unchanged exists@
> position r.p1,r.p2;
> expression e <=3D r.x,x,e1;
> iterator I;
> statement S;
> @@
>
> if (x@p1 =3D NULL) { ... when !=3D I(x,...) S
>                         when !=3D e =3D e1
>                         when !=3D e +=3D e1
>                         when !=3D e -=3D e1
>                         when !=3D ++e
>                         when !=3D --e
>                         when !=3D e++
>                         when !=3D e--
>                         when !=3D &e
>    kfree@p2(x); ... return ...; }
>
> @ok depends on unchanged exists@
> position any r.p1;
> position r.p2;
> expression x;
> @@
>
> ... when !=3D true x@p1 =3D NULL
> kfree@p2(x);
>
> @depends on !ok && unchanged@
> position r.p2;
> expression x;
> @@
>
> *kfree@p2(x);
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>
> ---
>  drivers/media/platform/davinci/vpbe.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platfo=
rm/davinci/vpbe.c
> index c4a82a1..1125a87 100644
> --- a/drivers/media/platform/davinci/vpbe.c
> +++ b/drivers/media/platform/davinci/vpbe.c
> @@ -771,7 +771,6 @@ static int vpbe_initialize(struct device *dev, struct=
 vpbe_device *vpbe_dev)
>         return 0;
>
>  vpbe_fail_amp_register:
> -       kfree(vpbe_dev->amp);

Now that you removed this kfree, you could remove this label too. Very
nice your cleanup :)

>  vpbe_fail_sd_register:
>         kfree(vpbe_dev->encoders);
>  vpbe_fail_v4l2_device:
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Att,

Marcos Paulo de Souza
Acad=EAmico de Ciencia da Computa=E7=E3o - FURB - SC
"Uma vida sem desafios =E9 uma vida sem raz=E3o"
"A life without challenges, is a non reason life"
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
