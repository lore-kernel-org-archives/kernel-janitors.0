From: Jaco Kroon <jaco@kroon.co.za>
Date: Fri, 15 Jun 2007 16:47:01 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <4672C285.6050800@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Fri, 15 Jun 2007, Jaco Kroon wrote:
> 
>> Robert P. J. Day wrote:
>>> On Fri, 15 Jun 2007, Vegard Nossum wrote:
>>>
>>>> On 6/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>>>>>   here's a patch i submitted to andrew to centralize checking for a
>>>>> proper version of gcc when building the kernel, but andrew claims it
>>>>> broke the build.  i'm trying to reproduce the problem, and i'd
>>>>> appreciate it if anyone else wants to apply this patch and try a build
>>>>> based on "allyesconfig" or "allmodconfig" on x86 to see if they run
>>>>> into some kind of issue, cuz i'm just not seeing it here.  thanks.
>>>> It works for me (using gcc 4.1.1 for i386 on linus's tree). Removing
>>>> that explanatory comment is not very nice, though.
>>> which explanatory comment?  the one from init/main.c?  but why would i
>>> leave it in when the code it pertains to has been removed?
>> Move the comment perhaps?
> 
> for what reason, exactly?  the purpose of that preprocessor content is
> to warn the user about a bad version of gcc.  it does that when the
> user tries to build.  why comment it?  i'm guessing most users will
> never look at that header file, anyway.
> 
> and, more to the point, that content is fairly self-explanatory.  how
> would adding redundant comments improve the situation?  it would be
> like having a line of code such as
> 
>    i = i + 1;
> 
> and commenting that with:
> 
>   /* add 1 to i */

The comment explained _why_ those checks were done, ie, it generates bad 
builds.  The pre-processor code simply states _which_ compilers are 
acceptable.

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
