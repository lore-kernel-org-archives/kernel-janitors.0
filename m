From: =?koi8-r?B?5dfHxc7JyiDwz8zRy8/X?= <zbr@ioremap.net>
Date: Sun, 01 Mar 2015 01:49:14 +0000
Subject: Re: [patch] w1: small cleanup in w1_family_notify()
Message-Id: <370051425174554@web4m.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150220105302.GB7895@mwanda>
In-Reply-To: <20150220105302.GB7895@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan

20.02.2015, 13:53, "Dan Carpenter" <dan.carpenter@oracle.com>:
> "sl->family->fops" and "fops" are the same thing, but it's nicer to use
> "fops" everywhere.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, thank you

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index 181f41c..59f932f 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -649,7 +649,7 @@ static int w1_family_notify(unsigned long action, str=
uct w1_slave *sl)
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Abreak;
> =9A=9A=9A=9A=9A=9A=9A=9A=9Acase BUS_NOTIFY_DEL_DEVICE:
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Aif (fops->remove_slave)
> - sl->family->fops->remove_slave(sl);
> + fops->remove_slave(sl);
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Aif (fops->groups)
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=
=9Asysfs_remove_groups(&sl->dev.kobj, fops->groups);
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9A=9Abreak;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
