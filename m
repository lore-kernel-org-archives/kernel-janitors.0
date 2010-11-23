From: walter harms <wharms@bfs.de>
Date: Tue, 23 Nov 2010 14:45:18 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <4CEBD37E.5060107@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com> <20101112120834.33062900.akpm@linux-foundation.org> <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack>
In-Reply-To: <20101123140111.GA3816@hack>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?QW3DqXJpY28gV2FuZw==?= <xiyou.wangcong@gmail.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segoon@openwall.com>, Andreas Dilger <adilger.kernel@dilger.ca>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>



Am 23.11.2010 15:01, schrieb Américo Wang:
> On Mon, Nov 15, 2010 at 08:12:21PM +0100, Eric Dumazet wrote:
>> Le dimanche 14 novembre 2010 à 18:06 -0800, Andrew Morton a écrit : 
>>> On Sun, 14 Nov 2010 12:25:33 +0300 Vasiliy Kulikov <segoon@openwall.com> wrote:
>>>>  
>>>>  	if (timeval) {
>>>> -		rtv.tv_sec = rts.tv_sec;
>>>> -		rtv.tv_usec = rts.tv_nsec / NSEC_PER_USEC;
>>>> +		struct timeval rtv = {
>>>> +			.tv_sec = rts.tv_sec,
>>>> +			.tv_usec = rts.tv_nsec / NSEC_PER_USEC
>>>> +		};
>>>>  
>>>>  		if (!copy_to_user(p, &rtv, sizeof(rtv)))
>>>>  			return ret;
>>>
>>> Please check the assembly code - this will still leave four bytes of
>>> uninitalised stack data in 'rtv', surely.
>>
>> Thats a good question.
>>
>> In my understanding, gcc should initialize all holes (and other not
>> mentioned fields) with 0, even for automatic storage [C99 only mandates
>> this on static storage]
>>
>> I tested on x86_64 and this is the case, but could not find a definitive
>> answer in gcc documentation.
>>
> 
> Yeah, this is not clearly defined by C99 I think, but we can still
> find some clues in 6.2.6.1, Paragraph 6,
> 
> "
> When a value is stored in an object of structure or union type,
> including in a member object, the bytes of the object representation
> that correspond to any padding bytes take unspecified values.
> "
> 
> So we can't rely on the compiler to initialize the padding bytes
> too.
> 
hi all,
as we see this is not a question of c99.
Maybe we can convince the gcc people to make 0 padding default. That will not solve the
problems for other compilers but when they claim "works like gcc" we can press then to
support this also. I can imagine that this will close some other subtle leaks also.

People that still want a "undefined" (for what ever reason) can use an option to enable it
again (e.g.  --no-zero-padding).

do anyone have a contact so we can forward that request ?

re,
 wh
