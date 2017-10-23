From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Oct 2017 08:45:27 +0000
Subject: Re: [PATCH] gpu/drm/bridge/sii9234: Use common error handling code in sii9234_writebm()
Message-Id: <54f4eff0-e7bb-214b-980e-208587850037@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8bb4a1d2-8876-731f-2938-8be075f4252c@users.sourceforge.net>
 <20171023071859.m55dgxzooje4i35e@mwanda>
In-Reply-To: <20171023071859.m55dgxzooje4i35e@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maciej Purski <m.purski@samsung.com>, Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>  	ret =3D i2c_smbus_write_byte_data(client, offset, value);
>> -	if (ret < 0) {
>> -		dev_err(ctx->dev, "writebm: %4s[0x%02x] <- 0x%02x\n",
>> -			sii9234_client_name[id], offset, value);
>> -		ctx->i2c_error =3D ret;
>> -	}
>> +	if (!ret)
>> +		return 0;
>=20
> Ugh.  No.  Don't do success handling on the last if statement.

I find my approach useful in this case.


> Also while I personally prefer testing for non-zero,

I got used to this checking style to some degree.


> the ALSA people got annoyed at you for changing tests for < 0

It seems that involved software developers have got special preferences the=
re.


> but you're doing it again.

I dared to propose such an adjustment once more.
Would you like discuss corresponding reasons any further?


> And it introduces a bug,

Unfortunately, a hiccup in my software development attention =E2=80=A6


> although I see now that you fixed it in v2.

Thanks that you noticed also this small update.

https://patchwork.kernel.org/patch/10021767/
https://lkml.kernel.org/r/<2ecf0bb7-7129-40e4-cefc-0bc2d0f7ee8b@users.sourc=
eforge.net>


> I can't get excited about these sort of risky low value patches.

I try again to point special software improvement opportunities out.


>> +report_failure:
>> +	dev_err(ctx->dev, "writebm: %4s[0x%02x] <- 0x%02x\n",
>> +		sii9234_client_name[id], offset, value);
>> +	ctx->i2c_error =3D ret;
>>  	return ret;
>>  }

How do you think about to move this source code to the end of
this function implementation?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
