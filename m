From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 25 Jul 2019 12:40:43 +0000
Subject: Re: [1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <42a3af53-e349-6c5b-fa0f-0113fccbe9eb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <e3a37d93-0353-ebed-948a-991add184616@web.de>
 <alpine.DEB.2.21.1907250632500.2535@hadrien>
In-Reply-To: <alpine.DEB.2.21.1907250632500.2535@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org

>>> @@
>>> (
>>> -x = strlcpy
>>> +stracpy
>>>   (e1.f, e2
>>> -    , i2
>>>   )@p;
>>>   ... when != x
>>>
>>> |
>>
>> I wonder about the deletion of the assignment target.
>> Should the setting of such a variable be usually preserved?
>
> If it is a local variable and never subsequently used, it doesn't seem
> very useful.

Such an explanation is easier to understand.

* How do you think about the possibility that it was (accidentally)
  forgotten to use such a local variable?

* Your transformation can result in an intentionally unused return value.
  Would you like point any more source code places out
  where values are unused so far?

Regards,
Markus
