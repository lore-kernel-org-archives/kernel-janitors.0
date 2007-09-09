From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 09 Sep 2007 08:54:43 +0000
Subject: Re: some version_string() magic i'm not aware of?
Message-Id: <Pine.LNX.4.64.0709090454020.28019@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709072033570.10879@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709072033570.10879@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 9 Sep 2007, Vegard Nossum wrote:

> On 9/8/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> > #define version(a) Version_ ## a
> > #define version_string(a) version(a)
> >
> > int version_string(LINUX_VERSION_CODE);
> > ...
> >
> > puzzled because this appears to be the only place in the entire
> > tree that uses the macro version_string().  so is there some
> > reason it even exists, as opposed to just using version() as it's
> > defined there?
>
> The double macro is needed to create a symbol with the name
> Version_<LINUX_VERSION_CODE>. If you simply replace "version_string"
> with "version", you'd get a symbol named
> "Version_LINUX_VERSION_CODE".

ah, quite right -- i *figured* there was a reason for that, i just
didn't see it right away.  thanks.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
