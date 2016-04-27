From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Wed, 27 Apr 2016 11:14:55 +0000
Subject: Re: [patch] w1: silence an uninitialized variable warning
Message-Id: <514231461755695@web6g.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414093548.GG16549@mwanda>
In-Reply-To: <20160414093548.GG16549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan

14.04.2016, 12:36, "Dan Carpenter" <dan.carpenter@oracle.com>:
> If kstrtoint() returns -ERANGE then "tmp" is uninitialized.

Looks good to me, please pull it into janitors tree

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Evgeniy Polaykov <zbr@ioremap.net>

> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index 89a7847..bb34362 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -335,7 +335,7 @@ static ssize_t w1_master_attribute_store_max_slave_co=
unt(struct device *dev,
> =9A=9A=9A=9A=9A=9A=9A=9A=9Aint tmp;
> =9A=9A=9A=9A=9A=9A=9A=9A=9Astruct w1_master *md =3D dev_to_w1_master(dev);
>
> - if (kstrtoint(buf, 0, &tmp) =3D -EINVAL || tmp < 1)
> + if (kstrtoint(buf, 0, &tmp) || tmp < 1)
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Areturn -EINVAL;
>
> =9A=9A=9A=9A=9A=9A=9A=9A=9Amutex_lock(&md->mutex);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
