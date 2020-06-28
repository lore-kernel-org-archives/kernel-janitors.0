From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 28 Jun 2020 11:17:59 +0000
Subject: Re: [PATCH] mm: Free unused pages in kmalloc_order()
Message-Id: <c5f54ce3-dad6-a2aa-d32a-cc7620676b76@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Long Li <lonuxli.64@gmail.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Pekka Enberg <penberg@kernel.org>

> kmalloc(1024, GFP_HIGHUSER) can allocate memory normally,
> kmalloc(64*1024, GFP_HIGHUSER) will cause a memory leak,

Would you like to explain the influence of the selected allocation size
in a different way?


> because alloc_pages returns highmem physical pages, but it cannot be directly
> converted into a virtual address and return NULL, the pages has not
> been released. Usually driver developers will not use the
> GFP_HIGHUSER flag to allocate memory in kmalloc, but I think this
> memory leak is not perfect, it is best to be fixed.

I suggest to improve this change description.

* Did you apply any special analysis tools?

* How do you think about to split the text into more sentences?

* Would you like to extend any software documentation?


> This is the first time I have posted a patch,

I find this information irrelevant for the proposed commit message.


> there may be something wrong.

There are usual risks to consider also for such software development.

Will it become helpful to add the tag “Fixes”?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=719fdd32921fb7e3208db8832d32ae1c2d68900f#n183

Regards,
Markus
