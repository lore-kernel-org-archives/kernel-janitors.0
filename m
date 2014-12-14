From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Sun, 14 Dec 2014 17:01:18 +0000
Subject: Re: [patch 1/2] ALSA: oxfw: some signedness bugs
Message-Id: <548DC25E.5030504@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141212192703.GA22234@mwanda> <548BC973.3090004@sakamocchi.jp> <20141213070414.GA4973@mwanda> <548C1196.4010503@sakamocchi.jp> <s5hy4qb5ufo.wl-tiwai@suse.de>
In-Reply-To: <s5hy4qb5ufo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Dec 14 2014 02:30, Takashi Iwai wrote:
> At Sat, 13 Dec 2014 19:14:46 +0900,
> Takashi Sakamoto wrote:
>>
>> On Dec 13 2014 16:04, Dan Carpenter wrote:
>>> On Sat, Dec 13, 2014 at 02:06:59PM +0900, Takashi Sakamoto wrote:
>>>> On Dec 13 2014 04:27, Dan Carpenter wrote:
>>>>> This code tends to use unsigned variables by default and it causes
>>>>> signedness bugs when we use negative variables for error handling.
>>>>> The "i" and "j" variables are used to iterated over small positive
>>>>> values and so they should be type "int".  The "len" variable doesn't
>>>>> *need* to be signed but it should be signed to make the code easier to
>>>>> read and audit.
>>>>>
>>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Note that Dan's suggestions are about the variables like "i" and "j".
> These are used normally for small loop counts, and they are int in a
> standard idiom.  If they are declared as another type, you force
> reader's attention *unnecessarily*, and it decreases the readability
> (i.e. they have to read the loop code as somewhat special even if
> it's a normal loop).  This is the only big drawback, and the rest
> merit/demerit are almost ignorable, IMO.
> 
> Of course, in some cases, a loop count might be better in unsigned.
> But then a different variable name should be used instead.
> 
> After all, this is rather a minor issue, almost a bikeshed topic, so I
> didn't care much while reviewing your patches, and I still don't care
> whether this fix patch will have int or unsigned for i.  But, it'd be
> good if you keep this information in your mind, at least.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
o-takashi@sakamocchi.jp

