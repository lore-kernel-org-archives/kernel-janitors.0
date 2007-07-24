From: Ravid Baruch Naali <ravid@codefidence.com>
Date: Tue, 24 Jul 2007 19:52:56 +0000
Subject: Re: [KJ][PATCH]dev->mem_start default value (~0) test (final go)
Message-Id: <46A65898.5010801@codefidence.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46A5C2FE.6040602@codefidence.com>
In-Reply-To: <46A5C2FE.6040602@codefidence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Your comment was on my mind before submitting the patch:

It's always hard to know what's best: splitting the long patch, which
repeat it self, or combined it to one. It took me a while to decide but
finally I came to the conclusion that I would expect my colleague, to
combine.
Looking at other patches in the archive I could not tell what's the rule
of thumb.

I also followed the FAQ answer "Try splitting them up per subsystem
(drivers/net/ ..." (all my patch refers to drivers/net)
So at the end of the day I'm left confuse at what is best.

Cripps wrote:
>>> 3. Write readable code
>>>       #define LIFE_THE_UNIVERSE_AND_EVERYTHING 42
>>>       ...
>>>       if (answer = LIFE_THE_UNIVERSE_AND_EVERYTHING)
>>
>> I recommend the book named "The Practice of Programming" for you.
>> It tells you how to write readable and nice code.
> 
>    I am in agreement, way number 3 is definitely the best way to write
> code; I should probably start making my code
> easier to read.
>    In addition, Ravid, that's a fairly hefty patchfile. Personally, I would
> split the existing file into individual patches
> for each file being patched, that way it's easy to look over the patchfile
> and go "okay, this all looks right to me,
> lets move on." Splitting up large patchfiles makes processing patches
> easier, and faster, for kernel maintainers.
> 
> -acripps
> 

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
