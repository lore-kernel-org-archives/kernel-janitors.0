From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Fri, 20 Dec 2019 17:17:53 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <20191220171753.GA234417@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
 <0557f349-322c-92b3-9fc3-94e59538ca91@web.de>
In-Reply-To: <0557f349-322c-92b3-9fc3-94e59538ca91@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Dec 20, 2019 at 05:23:27PM +0100, Markus Elfring wrote:
> >> Some functions allocate resources to which a pointer (or handle) is returned.
> >> I would find it nice then if such a pointer would contain also the background
> >> information by which functions the resource should usually be released.
> >>
> >> Can it become easier to determine such data?
> …
> > It's unclear to me what you are requesting/proposing?
> 
> I suggest to clarify combinations for object construction and proper resource release.
> 
> > Can you be a bit more concrete?
> 
> Further examples:
> * kmalloc ⇒ kfree
> * kobject_create ⇒ kobject_put
> * device_register ⇒ put_device
> 
> Can preprocessor macros help to express any more relationships for similar function pairs?

Sorry, this is still not making sense.  You said "a pointer would
contain also the background information by which the resource should
usually be released".  Huh?  There's no room for a pointer to also
store context of whether it was allocated using kmalloc, or malloc,
etc.

Did you have some concrete idea of how a preprocessor macros could be
used to perform what appears to be completely impractical?

And how would that information be used by the kernel?  And for what
benefit?  And can you show that the benefits will be worth the costs?

	      	      	   	- Ted
