From: Daniel Mack <daniel@zonque.org>
Date: Sat, 23 Mar 2019 10:38:04 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <2b1256f6-a63d-49f9-4231-b89d6c3cdcd3@zonque.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 23/3/2019 11:34 AM, YueHaibing wrote:
> On 2019/3/23 18:25, Daniel Mack wrote:
>> On 23/3/2019 11:15 AM, Pavel Machek wrote:

>>> If I look at code below, there's no difference between DEFSTATE_KEEP
>>> and DEFSTATE_ON, right? I can't see how it works.
>>
>> Ah, you're right. Yes, the "keep" branch needs to go away entirely.
>>
>> As the chip can't be queried for it's current state, the "keep" option
>> doesn't make sense. The only option in DT should be turn the LED on or
>> off at probe time. YueHaibing, can you add that to your patch?
>=20
> Ok. I will send v2 with this.

Note that Jacek just applied a patch of mine that removes all pdata
handling from this driver. In order to avoid merge conflicts, you might
want to base your patch on top of that.


https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git=
/commit/?h=3Dfor-next&id=BD7a59173aea


Thanks,
Daniel
