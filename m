From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Dec 2015 13:08:03 +0000
Subject: Re: [PATCH] posix-clock: Use an unsigned data type for a variable
Message-Id: <5676A833.4090700@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net>
 <alpine.DEB.2.02.1512201208250.2067@localhost6.localdomain6>
 <5676A399.4080007@users.sourceforge.net>
 <alpine.DEB.2.02.1512201350100.2067@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512201350100.2067@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>

>>>> Reuse the type from this poll call instead.
>>>
>>> Why use uint when the function return type it unsigned int?
>>
>> Do you prefer to express the type modifier once more there?
> 
> I don't know what the sentence means,

Can it be a matter of taste if the key word "unsigned" should be repeated
in such an use case?


> but I think that the type should be referenced in a consistent manner.

How do involved software designers and developers prefer to achieve
data type consistency here?

Which kind of naming convention will get priority?


>>> On the other hand, why is the function return type unsigned int
>>> when there is a return of a negative constant?
>>
>> This implementation detail can trigger further software development
>> considerations, can't it?
> 
> It would seem reasonable to address all of the signed/unsigned issues 
> related to the function return value at once.

Would you like to extend another evolving script for the semantic patch language?


I imagine that the general issue around the exception handling will cause
too many software development challenges to tackle them "at once".

Regards,
Markus
