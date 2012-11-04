From: Sasha Levin <levinsasha928@gmail.com>
Date: Sun, 04 Nov 2012 16:00:54 +0000
Subject: Re: [PATCH 0/8] drop if around WARN_ON
Message-Id: <CA+1xoqfa6CMcsjuOQ_QRRK7kGwkFPCVvrS44rk3Xf1S2HFPTow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
 <CA+1xoqd-UQXg0nuE1t5ayYY1Ow81er2mHUFUow=mfcwzkCPW5A@mail.gmail.com> <alpine.DEB.2.02.1211041656580.1960@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1211041656580.1960@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Nov 4, 2012 at 10:57 AM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> On Sun, 4 Nov 2012, Sasha Levin wrote:
>
>> Hi Julia,
>>
>> On Sat, Nov 3, 2012 at 4:30 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>>>
>>> These patches convert a conditional with a simple test expression and a
>>> then branch that only calls WARN_ON(1) to just a call to WARN_ON, which
>>> will test the condition.
>>>
>>> // <smpl>
>>> @@
>>> expression e;
>>> @@
>>>
>>> (
>>> if(<+...e(...)...+>) WARN_ON(1);
>>> |
>>> - if (e) WARN_ON(1);
>>> + WARN_ON(e);
>>> )// </smpl>
>>
>>
>> So this deals with WARN_ON(), are you considering doing the same for
>> the rest of it's friends?
>
>
> I tried WARN_ON_ONCE, but the pattern never occurred.  Are there others that
> are worth trying?

Definitely!

Here's the semantic patch I've got:

@@
expression e;
@@

(
- if (e) WARN_ON(1);
+ WARN_ON(e);
|
- if (e) WARN_ON_ONCE(1);
+ WARN_ON_ONCE(e);
|
- if (e) WARN_ON_SMP(1);
+ WARN_ON_SMP(e);
|
- if (e) BUG();
+ BUG_ON(e);
)

This gave me a really huge patch output.

I can send it out if you think the patch above looks good.


Thanks,
Sasha
