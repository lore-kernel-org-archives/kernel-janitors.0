From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 19 Jun 2007 01:22:33 +0000
Subject: Re: [KJ] Makefile question
Message-Id: <20070619012233.GP8154@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <63b6c970706181732y6b21b632yff6af81567ab55f6@mail.gmail.com>
In-Reply-To: <63b6c970706181732y6b21b632yff6af81567ab55f6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 18, 2007 at 08:32:54PM -0400, tiob lew wrote:
> I have a problem about Makefile and gdb.

This is completely off-topic for this list.

> How should I modify Makefile so that the program could be debugged by gdb.

However, I can see what your problem is.  Your rule:

> $@: $<
>    $(CC) $(CFLAGS) -c $<

is never being invoked.

Just set CXXFLAGS instead of CFLAGS, and the predefined implicit rule
will take care of it.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
