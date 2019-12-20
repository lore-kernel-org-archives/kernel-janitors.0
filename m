From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Dec 2019 18:00:09 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <f802d21a-e6cb-f947-2e52-8553f5e255d5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
 <0557f349-322c-92b3-9fc3-94e59538ca91@web.de>
 <20191220171753.GA234417@mit.edu>
In-Reply-To: <20191220171753.GA234417@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

>> Further examples:
>> * kmalloc ⇒ kfree
>> * kobject_create ⇒ kobject_put
>> * device_register ⇒ put_device
>>
>> Can preprocessor macros help to express any more relationships for similar function pairs?
>
> Sorry, this is still not making sense.

I suggest to reconsider such a view.


> …  You said "a pointer would
> contain also the background information by which the resource should
> usually be released".  Huh?  There's no room for a pointer to also
> store context of whether it was allocated using kmalloc, or malloc, etc.

There are metadata (software documentation) to consider in the source code.

You get usually informed by comments for some allocation functions
which is the corresponding resource release function.
Such comments can vary. Thus I would appreciate to work with these data
in a more structured format.


> Did you have some concrete idea of how a preprocessor macros could be
> used to perform what appears to be completely impractical?

A macro can be chosen to which function names can be passed.

Example:
TRIGGER_RELEASE_AFTER(kfree, kmalloc, kcalloc, kzalloc, kmemdup)

Appropriate data type definitions could eventually be generated
by related macros.


> And how would that information be used by the kernel?

Documentation purposes.


> And for what benefit?

Consistent representation of relationships in a structured way.


> And can you show that the benefits will be worth the costs?

I propose to improve possibilities also for the support of better
source code analysis.

Regards,
Markus
