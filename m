From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 04 Nov 2012 16:16:58 +0000
Subject: Re: [PATCH 0/8] drop if around WARN_ON
Message-Id: <alpine.DEB.2.02.1211041708190.1960@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr> <CA+1xoqd-UQXg0nuE1t5ayYY1Ow81er2mHUFUow=mfcwzkCPW5A@mail.gmail.com> <alpine.DEB.2.02.1211041656580.1960@localhost6.localdomain6>
 <CA+1xoqfa6CMcsjuOQ_QRRK7kGwkFPCVvrS44rk3Xf1S2HFPTow@mail.gmail.com>
In-Reply-To: <CA+1xoqfa6CMcsjuOQ_QRRK7kGwkFPCVvrS44rk3Xf1S2HFPTow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sasha Levin <levinsasha928@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 4 Nov 2012, Sasha Levin wrote:

> On Sun, Nov 4, 2012 at 10:57 AM, Julia Lawall <julia.lawall@lip6.fr> wrote:
>> On Sun, 4 Nov 2012, Sasha Levin wrote:
>>
>>> Hi Julia,
>>>
>>> On Sat, Nov 3, 2012 at 4:30 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>>>>
>>>> These patches convert a conditional with a simple test expression and a
>>>> then branch that only calls WARN_ON(1) to just a call to WARN_ON, which
>>>> will test the condition.
>>>>
>>>> // <smpl>
>>>> @@
>>>> expression e;
>>>> @@
>>>>
>>>> (
>>>> if(<+...e(...)...+>) WARN_ON(1);
>>>> |
>>>> - if (e) WARN_ON(1);
>>>> + WARN_ON(e);
>>>> )// </smpl>
>>>
>>>
>>> So this deals with WARN_ON(), are you considering doing the same for
>>> the rest of it's friends?
>>
>>
>> I tried WARN_ON_ONCE, but the pattern never occurred.  Are there others that
>> are worth trying?
>
> Definitely!
>
> Here's the semantic patch I've got:
>
> @@
> expression e;
> @@
>
> (
> - if (e) WARN_ON(1);
> + WARN_ON(e);
> |
> - if (e) WARN_ON_ONCE(1);
> + WARN_ON_ONCE(e);
> |
> - if (e) WARN_ON_SMP(1);
> + WARN_ON_SMP(e);
> |
> - if (e) BUG();
> + BUG_ON(e);
> )
>
> This gave me a really huge patch output.
>
> I can send it out if you think the patch above looks good.

I didn't change any cases where the if test contains a function call.  The 
current definitions of WARN_ON seem to always evaluate the condition 
expression, but I was worried that that might not always be the case.  And 
calling a function (the ones I remember were some kinds of print 
functions) seems like something one might not want buried in the argument 
of a debugging macro.

WARN_ON_SMP is just WARN_ON if CONFIG_SMP is true, but it is just 0 
otherwise.  So in that case it seems important to check that one is not 
throwing away something important.

I remember working on the BUG_ON case several years ago, and other people 
worked on it too, but I guess some are still there...  The current 
definitions of BUG_ON seem to keep the condition, but there are quite a 
few specialized definitions, so someone at some point might make a version 
that does not have that property.

julia

