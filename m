From: Andrzej Hajda <a.hajda@samsung.com>
Date: Tue, 15 Sep 2015 13:51:14 +0000
Subject: Re: [PATCH] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <55F82252.4090900@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442309232-5902-1-git-send-email-a.hajda@samsung.com>
 <55F816BC.5050407@users.sourceforge.net>
 <alpine.DEB.2.10.1509151505240.2537@hadrien>
 <55F81A31.3040808@users.sourceforge.net>
 <alpine.DEB.2.10.1509151530190.2537@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509151530190.2537@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 09/15/2015 03:31 PM, Julia Lawall wrote:
> On Tue, 15 Sep 2015, SF Markus Elfring wrote:
>
>>>>  v@p
>>>> (
>>>> *< 0
>>>> |
>>>> *<= 0
>>>> )
>>> It does not, and is not intended to, work.  The branches of a disjunction
>>> should be complete expressions.
>> Will the following SmPL approach be more appropriate then?
>>
>> (
>> *v@p < 0
>> |
>> *v@p <= 0
>> )
> Actually, all of
>
> v < 0 (never true)
> v <= 0 (same as v = 0)
> v >= 0 (always true)
>
> would seem to merit attention.  Andrzej, what do you think?

You are right, the 2nd case should be also addressed,
such code is misleading.
I will prepare then 2nd version of the patch.

Regards
Andrzej

>
> julia
>
>
>> Regards,
>> Markus
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

