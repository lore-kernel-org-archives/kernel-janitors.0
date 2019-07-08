From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Mon, 08 Jul 2019 10:18:48 +0000
Subject: Re: [PATCH] mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <6e8eab5f-1f5c-b3dc-6b65-96a874ec2789@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
 <20190707005251.GQ17978@ZenIV.linux.org.uk>
 <4b06e2fb-a0ba-56e5-b46b-98e986e6f2fd@web.de>
In-Reply-To: <4b06e2fb-a0ba-56e5-b46b-98e986e6f2fd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On 07.07.19 09:56, Markus Elfring wrote:
>>> Avoid an extra function call by using a ternary operator instead of
>>> a conditional statement.
>>
>> Which is a good thing, because...?
> 
> I suggest to reduce a bit of duplicate source code also at this place.

Duplicate code (logic) or just characters ?

IMHO, readability is an important aspect, so we could be careful about
that. Some of your other patches IMHO made it actually a bit easier
to read, but this particular case doesnt seem so to (just according
to my personal taste).

I believe the compiler can do optimize that, based on the given flags.
(eg. size vs. speed). Therefore, I think that readability for the
human reader should be primary argument.

>> ... except that the result is not objectively better by any real criteria.
> 
> We can have different opinions about the criteria which are relevant here.

Which criterias are you operating on ?

> I dare to point another change possibility out.
> I am unsure if this adjustment will be picked up finally.

I think it's good that you're using tools like cocci for pointing out
*possible* points of useful refactoring. But that doesn't mean that a
particular patch can be accepted or not in the greater context.

Note that such issues are pretty subjective - it's not a technical but
an asthetic matter, so such issues can't be resolved by logic. Here, the
better something fits the personal taste of the maintainrs, the easier
it is for them to quickly understand the code (w/o having to give it any
deeper thoughts), thus reduces their brain load. Therefore that should
be the the primary argument left.

Don't see this as a judgment of your work as such - this kind of work
just tends to have a high rate of non-acceptable output (unless the
individual maintainer doing it himself).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
