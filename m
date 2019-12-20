From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Dec 2019 16:23:27 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <0557f349-322c-92b3-9fc3-94e59538ca91@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
In-Reply-To: <20191220151945.GD59959@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

>> Some functions allocate resources to which a pointer (or handle) is returned.
>> I would find it nice then if such a pointer would contain also the background
>> information by which functions the resource should usually be released.
>>
>> Can it become easier to determine such data?
…
> It's unclear to me what you are requesting/proposing?

I suggest to clarify combinations for object construction and proper resource release.


> Can you be a bit more concrete?

Further examples:
* kmalloc ⇒ kfree
* kobject_create ⇒ kobject_put
* device_register ⇒ put_device

Can preprocessor macros help to express any more relationships for similar function pairs?

Regards,
Markus
