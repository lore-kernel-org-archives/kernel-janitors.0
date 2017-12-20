From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 20 Dec 2017 09:10:14 +0000
Subject: Re: [PATCH] mei: fix incorrect logical operator in if statement
Message-Id: <fbefeafe-50d6-2c1f-aecb-f334c9e555e6@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171219173530.15864-1-colin.king@canonical.com>
 <5B8DA87D05A7694D9FA63FD143655C1B74A82576@hasmsx108.ger.corp.intel.com>
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B74A82576@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: "Winkler, Tomas" <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 20/12/17 08:58, Winkler, Tomas wrote:
>=20
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The current expression using the || operator is always true because
>> dev->dev_state cannot be equal to two different values at the same time.
>> Fix this by replacing the || with &&.
>>
>> Detected by CoverityScan, CID#1463042 ("Constant expression result")
>>
>> Fixes: 8d52af6795c0 ("mei: speed up the power down flow")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Shame on me.

No worries, that's why I run static analysis linux-next.

> Ack.
> Tomas
>=20
>> ---
>>  drivers/misc/mei/hw-me.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c index
>> 0b21f9ec00f5..334ab02e1de2 100644
>> --- a/drivers/misc/mei/hw-me.c
>> +++ b/drivers/misc/mei/hw-me.c
>> @@ -1261,7 +1261,7 @@ irqreturn_t mei_me_irq_thread_handler(int irq,
>> void *dev_id)
>>  			break;
>>
>>  		if (rets &&
>> -		    (dev->dev_state !=3D MEI_DEV_RESETTING ||
>> +		    (dev->dev_state !=3D MEI_DEV_RESETTING &&
>>  		     dev->dev_state !=3D MEI_DEV_POWER_DOWN)) {
>>  			dev_err(dev->dev, "mei_irq_read_handler ret >> %d.\n",
>>  						rets);
>> --
>> 2.14.1
>=20
> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=BF=
=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=BF=BD^=EF=BF=
=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=DE=966=EF=BF=
=BD=EF=BF=BD=EF=BF=BD+=EF=BF=BD)=EF=BF=BD=EF=BF=BD=EF=BF=BDw*=1Fjg=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=1E=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=A2j/=
=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=DE=96=EF=BF=BD=EF=BF=BD2=EF=BF=BD=DE=
=99=EF=BF=BD=EF=BF=BD=EF=BF=BD&=EF=BF=BD)=DF=A1=EF=BF=BDa=EF=BF=BD=EF=BF=BD=
=7F=EF=BF=BD=EF=BF=BD=1E=EF=BF=BDG=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=0F=
=EF=BF=BDj:+v=EF=BF=BD=EF=BF=BD=EF=BF=BDw=EF=BF=BD=D9=A5
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
