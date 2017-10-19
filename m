From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Oct 2017 18:56:08 +0000
Subject: Re: kernel/module: Delete an error message for a failed memory allocation in add_module_usage()
Message-Id: <cb97c1e6-0218-6b79-fd72-9ceaae976d16@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a47bc166-7592-2ff8-9b94-4d45e18b6004@users.sourceforge.net>
 <20171019110824.wqkep7bpcx3dcw5w@redbean>
 <43c71898-82c3-215a-3176-e1a6d56ef10a@users.sourceforge.net>
 <1508412567.6806.36.camel@perches.com>
 <1dee801c-37b5-4d72-b33f-ebdc135b4f25@users.sourceforge.net>
 <1508413536.6806.38.camel@perches.com>
In-Reply-To: <1508413536.6806.38.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>

>>> Something like:
>>>
>>> "because there is a dump_stack() done on allocation failures
>>>  without __GFP_JNOWARN"
>>
>> How do you think about to convert such a description into a special format
>> for further reference documentation?
> 
> I think it's a bad idea if it's a "special" format.

Will it be nice to represent corresponding details as a better
“restructured text”?


> Always write _why_ some code is being changed.
> 
> People could read the commit descriptions and would not need
> to take extra time to lookup external references.

I would appreciate if I could copy a widely accepted explanation.


> Maybe add something like
> "see (commit <foo> or <file>)" for additional details"

Are there any related extensions possible besides other background information?
Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Regards,
Markus
