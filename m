From: Yuehaibing <yuehaibing@huawei.com>
Date: Thu, 25 Jul 2019 01:40:29 +0000
Subject: Re: [PATCH] carl9170: remove set but not used variable 'udev'
Message-Id: <1cfbfe67-e931-029b-1836-a6b796283c2c@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190724015411.66525-1-yuehaibing@huawei.com>
 <CAAd0S9BvTfRyUVkQzcczyNkU_oeU5hNdK3KVQzLsU21b4JGNTQ@mail.gmail.com>
In-Reply-To: <CAAd0S9BvTfRyUVkQzcczyNkU_oeU5hNdK3KVQzLsU21b4JGNTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

On 2019/7/25 3:42, Christian Lamparter wrote:
> On Wed, Jul 24, 2019 at 3:48 AM YueHaibing <yuehaibing@huawei.com> wrote:
>>
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/net/wireless/ath/carl9170/usb.c: In function 'carl9170_usb_disco=
nnect':
>> drivers/net/wireless/ath/carl9170/usb.c:1110:21: warning:
>>  variable 'udev' set but not used [-Wunused-but-set-variable]
>>
>> It is not used, so can be removed.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
> Isn't this the same patch you sent earlier:
>=20
> https://patchwork.kernel.org/patch/11027909/
>=20
>>From what I can tell, it's the same but with an extra [-next], I
> remember that I've acked that one
> but your patch now does not have it? Is this an oversight, because I'm
> the maintainer for this
> driver. So, in my opinion at least the "ack" should have some value
> and shouldn't be "ignored".
>=20
> Look, from what I know, Kalle is not ignoring you, It's just that
> carl9170 is no longer top priority.
> So please be patient. As long as its queued in the patchwork it will
> get considered.

Thank you for reminder. I forget the previous patch=EF=BC=8Cand our CI robot
report it again, So I do it again, sorry for confusion.

Just pls drop this and use previous one.

>=20
> Cheers,
> Christian
>=20
>>  drivers/net/wireless/ath/carl9170/usb.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/carl9170/usb.c b/drivers/net/wirel=
ess/ath/carl9170/usb.c
>> index 99f1897a775d..486957a04bd1 100644
>> --- a/drivers/net/wireless/ath/carl9170/usb.c
>> +++ b/drivers/net/wireless/ath/carl9170/usb.c
>> @@ -1107,12 +1107,10 @@ static int carl9170_usb_probe(struct usb_interfa=
ce *intf,
>>  static void carl9170_usb_disconnect(struct usb_interface *intf)
>>  {
>>         struct ar9170 *ar =3D usb_get_intfdata(intf);
>> -       struct usb_device *udev;
>>
>>         if (WARN_ON(!ar))
>>                 return;
>>
>> -       udev =3D ar->udev;
>>         wait_for_completion(&ar->fw_load_wait);
>>
>>         if (IS_INITIALIZED(ar)) {
>>
>>
>>
>=20
> .
>=20
