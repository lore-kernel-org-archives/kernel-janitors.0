From: Nicolas Palix <npalix@diku.dk>
Date: Thu, 30 Jul 2009 20:48:31 +0000
Subject: Re: [PATCH] Staging: hv: Replace typedef SG_BUFFER_LIST by struct
Message-Id: <Pine.LNX.4.64.0907302242540.18173@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907301737.23849.npalix@diku.dk> <20090730155844.GB20557@suse.de>
 <Pine.LNX.4.64.0907302020250.13698@ask.diku.dk> <20090730195229.GB27953@suse.de>
In-Reply-To: <20090730195229.GB27953@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 30 Jul 2009, Greg KH wrote:

> On Thu, Jul 30, 2009 at 08:35:08PM +0200, Nicolas Palix wrote:
>> On Thu, 30 Jul 2009, Greg KH wrote:
>>
>>> On Thu, Jul 30, 2009 at 05:37:23PM +0200, Nicolas Palix wrote:
>>>>
>>>> typedef SG_BUFFER_LIST is removed and its uses are replaced by the use of
>>>> struct scatterlist.
>>>
>>> Sweet!  thanks for doing this, very nice job, I'll go queue it up.
>>
>> I tried to change the RingBuffer too but I did not know
>> which API I should use.
>> The ring buffer in kernel/trace seems fine but it has some
>> dedicated features.
>>
>> Any hint?
>> Of which infrastructure are you thinking in your previous mail?
>
> I was thinking of include/linux/ring_buffer.h
>
> Does that not work for you?

It is perfect.

As its implementation is in kernel/trace and not in lib as scatterlist,
I just wanted to be sure before spending time on a patch. :)

thanks.

Nico

>
> thanks,
>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
