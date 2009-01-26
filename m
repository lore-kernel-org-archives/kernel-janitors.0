From: Manish Katiyar <mkatiyar@gmail.com>
Date: Mon, 26 Jan 2009 15:32:32 +0000
Subject: Re: [PATCH] : Remove unused variable pdev from drivers/net/r6040.c
Message-Id: <ea11fea30901260720t337d531eh970702ee5e0054df@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200901191441.24992.florian@openwrt.org>
In-Reply-To: <200901191441.24992.florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jan 19, 2009 at 7:11 PM, Florian Fainelli <florian@openwrt.org> wro=
te:
> Le Monday 19 January 2009 14:29:53 Manish Katiyar, vous avez =E9crit :
>> Below patch removes the following compilation warning.
>>
>> drivers/net/r6040.c:441: warning: unused variable 'pdev'
>>
>
> Good catch, thanks.

Hi Florian,

Will it automatically be picked up or will I have to send it again to Andre=
w ?

Thanks -
Manish



>
>>
>> Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>
>
> Acked-by: Florian Fainelli <florian@openwrt.org>
> --
> Best regards, Florian Fainelli
> Email : florian@openwrt.org
> http://openwrt.org
> -------------------------------
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
