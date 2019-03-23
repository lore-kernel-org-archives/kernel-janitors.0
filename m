From: Daniel Mack <daniel@zonque.org>
Date: Sat, 23 Mar 2019 10:57:52 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <c3950792-694a-742b-90ff-7a5b503570b1@zonque.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 23/3/2019 11:51 AM, Pavel Machek wrote:
> On Sat 2019-03-23 11:38:04, Daniel Mack wrote:
>> On 23/3/2019 11:34 AM, YueHaibing wrote:
>>> On 2019/3/23 18:25, Daniel Mack wrote:
>>>> On 23/3/2019 11:15 AM, Pavel Machek wrote:
>>
>>>>> If I look at code below, there's no difference between DEFSTATE_KEEP
>>>>> and DEFSTATE_ON, right? I can't see how it works.
>>>>
>>>> Ah, you're right. Yes, the "keep" branch needs to go away entirely.
>>>>
>>>> As the chip can't be queried for it's current state, the "keep" option
>>>> doesn't make sense. The only option in DT should be turn the LED on or
>>>> off at probe time. YueHaibing, can you add that to your patch?
>>>
>>> Ok. I will send v2 with this.
>>
>> Note that Jacek just applied a patch of mine that removes all pdata
>> handling from this driver. In order to avoid merge conflicts, you might
>> want to base your patch on top of that.
>>
> 
> Actually, Daniel, at this point I'd prefer you to take over this
> patch. You have the hardware and you are already working on the
> code...

YueHaibing's patch is fine except for the coding style issue. I can send
a 2nd patch on top of that that removes the handling of "keep".


Thanks,
Daniel
