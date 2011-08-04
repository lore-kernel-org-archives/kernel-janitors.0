From: Julie Sullivan <kernelmail.jms@gmail.com>
Date: Thu, 04 Aug 2011 20:31:58 +0000
Subject: Re: [PATCH] net/usb: Use kzalloc
Message-Id: <CAAVPGOPbspuvS_745bPwAPuWY6_N5VQX-mUhxo=RZhZDNSn0QA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312301372.2629.10.camel@localhost.localdomain>
	<20110803090223.GM4587@distanz.ch>
In-Reply-To: <20110803090223.GM4587@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Thomas Meyer <thomas@m3y3r.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> On 2011-08-02 at 18:09:28 +0200, Thomas Meyer <thomas@m3y3r.de> wrote:
>> --- a/drivers/net/usb/cdc_ncm.c 2011-07-26 00:46:08.126846923 +0200
>> +++ b/drivers/net/usb/cdc_ncm.c 2011-08-01 20:20:43.396390040 +0200
>> @@ -479,12 +479,10 @@ static int cdc_ncm_bind(struct usbnet *d
>> =A0 =A0 =A0 int temp;
>> =A0 =A0 =A0 u8 iface_no;
>>
>> - =A0 =A0 ctx =3D kmalloc(sizeof(*ctx), GFP_KERNEL);
>> + =A0 =A0 ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
>> =A0 =A0 =A0 if (ctx =3D NULL)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>>
>> - =A0 =A0 memset(ctx, 0, sizeof(*ctx));
>> -
>> =A0 =A0 =A0 init_timer(&ctx->tx_timer);
>> =A0 =A0 =A0 spin_lock_init(&ctx->mtx);
>> =A0 =A0 =A0 ctx->netdev =3D dev->net;
>>
>>
>> --

I think we could do with a log message before the SOB too (like you
did in your 'Use resource_size()' patch? :-)
The subject line is rather terse on its own.

Cheers
Julie
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
