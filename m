From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Sat, 24 May 2008 23:41:09 +0000
Subject: Re: some numbers on macros
Message-Id: <200805250141.09195.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805241748.19607.m.kozlowski@tuxland.pl> <20080524093350.60e6dc8d@infradead.org> <20080524185201.GZ2638@parisc-linux.org>
In-Reply-To: <20080524185201.GZ2638@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Arjan van de Ven <arjan@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

> On Sat, May 24, 2008 at 09:33:50AM -0700, Arjan van de Ven wrote:
> > unused macros in common header files are an indication of stale APIs
> > otoh.. and might be of some interest. (Same for static inline in
> > headers)
> 
> Possibly.  There's likely to be a lot of macros unused like these ones:

Maybe I wasn't precise enough. The script looks for macros which take argument(s)
i.e.

#define foobar() ...

> #define  PCI_X_CMD_MAX_READ     0x000c  /* Max Memory Read Byte Count */
>                                 /* Max # of outstanding split transactions */
> #define  PCI_X_CMD_SPLIT_1      0x0000  /* Max 1 */
> #define  PCI_X_CMD_SPLIT_2      0x0010  /* Max 2 */
> #define  PCI_X_CMD_SPLIT_3      0x0020  /* Max 3 */
> ...
> 
> where the macros embody the PCI specification in code -- possibly we
> don't use them yet, but if we ever did, we'd have the macros to use.

Agreed.

> Another category of false positive is macros that ought to be used,
> but the code that ought to be using them has decided to go its own way.
> That still indicates a bug, but not the one you might initially think.

Agreed.

> In summary, this is probably an interesting exercise, but the results
> would need to be interpreted with care.

Well I'll just go through some of them. This is long term task as its number is quite
big. Maybe I can improve the script some more or apply some other measures. I guess
one can find there all sort of macros and some part of them are leftovers from something
that was there some time ago.

Interesting part would be to write a 'parser' that actually sees the context and understands
cpp directives, that could 'walk' the tree.

	Mariusz
