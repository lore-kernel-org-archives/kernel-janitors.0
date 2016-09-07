From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 07 Sep 2016 10:36:23 +0000
Subject: Re: x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <f1caa945-b808-f6b5-6047-35c43330431f@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
 <CAGXu5jLSsU+daPP=uX+3T02RkTFguG1rtemOF-7Py_Fi=qYP6A@mail.gmail.com>
 <e24dae2d-b55a-d90a-9934-080e6165802b@users.sourceforge.net>
In-Reply-To: <e24dae2d-b55a-d90a-9934-080e6165802b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Kees Cook <keescook@chromium.org>
Cc: Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>



On 07/09/2016 09:49, SF Markus Elfring wrote:
>>> A multiplication for the size determination of a memory allocation
>>> indicated that an array data structure should be processed.
>>> Thus use the corresponding function "kmalloc_array".
>>>
>>> This issue was detected by using the Coccinelle software.
>>
>> Which rule-set was used?
> 
> Do you get an useful impression from one of my bug reports
> (or feature requests) like "Fix usage of white-space characters
> at two places for Linux coding style" which evolved together with
> the proposed software refactoring?
> https://github.com/coccinelle/coccinelle/issues/76
> 
> I am curious if the time is ready now for the development of another
> script for the semantic patch language which can be executed
> by the make interface "coccicheck" after Julia Lawall improved
> also software components a bit more recently.
> https://github.com/coccinelle/coccinelle/commits/
> 
> Are you looking for further possibilities to improve the involved
> source code search patterns?

Why are you not answering the simple question that was asked?

Paolo
