From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 15 May 2007 08:55:16 +0000
Subject: Re: [KJ] centralizing all of the types.h content?
Message-Id: <Pine.LNX.4.64.0705150450540.20354@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705150403510.19177@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705150403510.19177@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 15 May 2007, Alexey Dobriyan wrote:

> On 5/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >   is there any reason that most of the content of the various
> > include/asm-*/types.h files couldn't be centralized, perhaps in
> > include/linux/types.h?
>
> Yes! Lots of ifdefs, because files aren't quite identical.

oh, i realize that there are differences, but isn't there a lot of
duplicated content across all those files that will always
*necessarily* be identical?

i mean, is there a single architecture that *won't*, say, define the
following typedef:

  typedef __signed__ char __s8;

will there ever be an architecture for which the typedef "__s8"
*won't* be a signed char?  and if there might be, it would still be
more efficient to create a general include/asm-generic/types.h that
most people could use, and let some weird and wacky architecture
always override that with its own.

even with all those #ifdef's, it still seems like there's a lot of
common content whose duplication is unnecessary.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
