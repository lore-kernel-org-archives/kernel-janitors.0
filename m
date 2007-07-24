From: Ravid Baruch Naali <ravid@codefidence.com>
Date: Tue, 24 Jul 2007 19:40:53 +0000
Subject: Re: [KJ][PATCH]dev->mem_start default value (~0) test (final go)
Message-Id: <46A655C5.9020906@codefidence.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46A5C2FE.6040602@codefidence.com>
In-Reply-To: <46A5C2FE.6040602@codefidence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Thanks for the comment,

But this 3 ways is one of the first lecture you get from you programming
teacher.

Where and what ever I developed adding an extra define for constant like
0, ~0, 0xffff etc.. always received the opposite comment "what's the
extra confusion for?"

So it's a matter of opinion but ask your self if you would define 0 any
where.

As for any arbitrary constant I totally agree with you.

I would love to here from any code maintainer what's the linux kernel
convention for the constant I mentioned above.

Håkon Løvdal wrote:
> On 24/07/07, Ravid Baruch Naali <ravid@codefidence.com> wrote:
>>
>> -       if (dev->mem_start)
>> +       /*dev->mem_start can also be ~0 which is the default*/
>> +       if (dev->mem_start && dev->mem_start != ~0)
>>                 dev->mem_end = dev->mem_start + EL2_MEMSIZE;
>>
> 
> In my oppinion there are three ways to write code:
> 
> 1. Write unreadable code
> 
>        if (answer = 42)
> 
> 2. Write unreadable code and try to comment it readable
> 
>        if (answer = 42)    // life, the universe and everything
> 
> 3. Write readable code
>        #define LIFE_THE_UNIVERSE_AND_EVERYTHING 42
>        ...
>        if (answer = LIFE_THE_UNIVERSE_AND_EVERYTHING)
> 
> 
> I think your patch would be better by not hardcoding ~0 with
> a corresponding comment.
> 
> BR Håkon Løvdal

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
