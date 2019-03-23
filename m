From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 23 Mar 2019 10:44:45 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <85719cd9-eec2-7c29-a855-b212ac48f934@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2019/3/23 18:38, Daniel Mack wrote:
> On 23/3/2019 11:34 AM, YueHaibing wrote:
>> On 2019/3/23 18:25, Daniel Mack wrote:
>>> On 23/3/2019 11:15 AM, Pavel Machek wrote:
>=20
>>>> If I look at code below, there's no difference between DEFSTATE_KEEP
>>>> and DEFSTATE_ON, right? I can't see how it works.
>>>
>>> Ah, you're right. Yes, the "keep" branch needs to go away entirely.
>>>
>>> As the chip can't be queried for it's current state, the "keep" option
>>> doesn't make sense. The only option in DT should be turn the LED on or
>>> off at probe time. YueHaibing, can you add that to your patch?
>>
>> Ok. I will send v2 with this.
>=20
> Note that Jacek just applied a patch of mine that removes all pdata
> handling from this driver. In order to avoid merge conflicts, you might
> want to base your patch on top of that.
>=20
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.g=
it/commit/?h=3Dfor-next&id=BD7a59173aea

Yep, this has been linux-next , will based this.

Thanks!

>=20
>=20
> Thanks,
> Daniel
>=20
>=20
>=20
