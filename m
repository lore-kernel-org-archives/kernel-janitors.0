From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 12 Jan 2016 11:28:13 +0000
Subject: Re: [PATCH 2/2] mfd: smsc-ece1099: Refactoring for smsc_i2c_probe()
Message-Id: <5694E34D.9010609@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
 <56829630.6030706@users.sourceforge.net> <20160111081059.GS3331@x1>
 <20160111081219.GT3331@x1> <5694BE21.3010504@users.sourceforge.net>
 <20160112090532.GS19803@x1>
In-Reply-To: <20160112090532.GS19803@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Which topic would you prefer for my update suggestion instead?
>=20
> This one.
>=20
> "mfd: smsc-ece1099: Refactoring for smsc_i2c_probe()"
>=20
> The function name and just describing the changes as "refactoring" do
> not describe the changes in a helpful way.

Would you find a subject like "mfd: smsc-ece1099: Better exception handling
in smsc_i2c_probe()" acceptable?


>>>> Acked-by: Lee Jones <lee.jones@linaro.org>
>>
>> Do you really request that I should append this tag already to messages
>> for (my adjusted) commits you can not see so far?
>=20
> Yes.

Interesting =E2=80=A6


> The code looks fine,

Thanks for a bit of positive feedback.


> and if the commit log is still not up to scratch I just won't apply it. :)

Can we eventually agree on an useful message before I would dare another co=
mmit?

Will it be sufficient to delete the asterisks there?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
