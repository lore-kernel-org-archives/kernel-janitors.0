From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 13:06:25 +0000
Subject: Re: virtio_console: Less function calls in init_vqs() after error detection
Message-Id: <4306f978-13dd-ca69-97f7-3424905a1d53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
 <490b98e1-6129-f11f-55ff-94219ebce6d6@users.sourceforge.net>
 <20160921121038.GE1375@amit-lp.rh>
In-Reply-To: <20160921121038.GE1375@amit-lp.rh>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amit Shah <amit.shah@redhat.com>
Cc: virtualization@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> The kfree() function was called in up to five cases
>> by the init_vqs() function during error handling even if
>> the passed variable contained a null pointer.
>>
>> * Return directly after a call of the function "kmalloc_array" failed
>>   at the beginning.
>>
>> * Split a condition check for memory allocation failures so that
>>   each pointer from these function calls will be checked immediately.
>>
>>   See also background information:
>>   Topic "CWE-754: Improper check for unusual or exceptional conditions"
>>   Link: https://cwe.mitre.org/data/definitions/754.html
>>
>> * Adjust jump targets according to the Linux coding style convention.
> 
> So I've seen this series and I'm not yet sure how I feel about the
> patches - f.e. in this one, it adds more lines than it removes to
> achieve the same effect.

I find this consequence still debatable.


> I think the code is currently more readable than after these changes.

Thanks for your constructive feedback.

Can it be that an other software development concern is eventually overlooked?


> And even if kfree is called multiple times, it isn't a huge bother

I know also that the implementation of this function tolerates the passing
of null pointers.


> -- it's error case anyway, very unlikely to trigger, but keeps everything very readble.

I suggest to reconsider this design detail if it is really acceptable
for the safe implementation of such a software module.

* How much will it matter in general that four function call were performed
  in this use case without checking their return values immediately?

* Should it usually be determined quicker if a required resource like
  memory could be acquired before trying the next allocation?

Regards,
Markus
