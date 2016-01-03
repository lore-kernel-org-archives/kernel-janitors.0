From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 17:25:10 +0000
Subject: Re: [PATCH 8/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_set_timer()
Message-Id: <56895976.5040009@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688DF2D.6090204@users.sourceforge.net>
 <5688E268.9090600@users.sourceforge.net>
 <alpine.DEB.2.02.1601031345240.2053@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1601031345240.2053@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>  	ret =3D regmap_update_bits(data->regmap, ABB5ZES3_REG_TIM_CLK,
>> -				 mask, ABB5ZES3_REG_TIM_CLK_TAC1);
>> +				 ABB5ZES3_REG_TIM_CLK_TAC0
>> +				 | ABB5ZES3_REG_TIM_CLK_TAC1,
>> +				 ABB5ZES3_REG_TIM_CLK_TAC1);
>=20
> This doesn't seem like an improvement.

Interesting =85


> The concept (mask) has disappeared,

I suggest to drop another local variable.
Can the operator "Bitwise OR" be sufficient to indicate the concept "mask"?


> the binary operation is strangely broken,

Do you prefer an other source code formatting within the usual line length =
range?


> and the function call has one more line of arguments,

How should several long preprocessor symbols be combined together with inde=
ntation
so that they will fit into the limit of 80 characters?


> which all look sort of the same and thus are hard to understand.

Is this an usual consequence from an ordinary name pattern?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
