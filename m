From: Florian Fainelli <florian@openwrt.org>
Date: Mon, 19 Jan 2009 13:41:23 +0000
Subject: Re: [PATCH] : Remove unused variable pdev from drivers/net/r6040.c
Message-Id: <200901191441.24992.florian@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Le Monday 19 January 2009 14:29:53 Manish Katiyar, vous avez =E9crit=A0:
> Below patch removes the following compilation warning.
>
> drivers/net/r6040.c:441: warning: unused variable 'pdev'
>

Good catch, thanks.

>
> Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>

Acked-by: Florian Fainelli <florian@openwrt.org>
--=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
