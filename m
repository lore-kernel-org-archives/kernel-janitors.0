From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jan 2016 11:34:33 +0000
Subject: Re: [PATCH v3 2/3] gianfar: Delete unnecessary variable initialisations in gfar_ethflow_to_filer_tab
Message-Id: <5698D949.6000404@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56866E7F.8080609@users.sourceforge.net>
 <5698C53C.8060204@users.sourceforge.net>
 <5698C61A.90504@users.sourceforge.net> <20160115102947.GI4764@mwanda>
In-Reply-To: <20160115102947.GI4764@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@freescale.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> +++ b/drivers/net/ethernet/freescale/gianfar_ethtool.c
>> @@ -768,12 +768,12 @@ static void ethflow_to_filer_rules (struct gfar_pr=
ivate *priv, u64 ethflow)
>>  static int gfar_ethflow_to_filer_table(struct gfar_private *priv, u64 e=
thflow,
>>  				       u64 class)
>>  {
>> -	unsigned int last_rule_idx =3D priv->cur_filer_idx;
>> +	unsigned int last_rule_idx;
>=20
> This is a write only variable.  We can just remove it.

Can a static source code analysis tool like the software "http://smatch.sou=
rceforge.net/"
detect that such a variable is not read by this function implementation so =
far?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/net/ethernet/freescale/gianfar_ethtool.c?id=B75ec3af27bf011a760e2f44eb25=
a99b6fbb0fb3#n850

Does this place indicate an unwanted value assignment as a leftover,
or are there any other actions missing?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
