From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sun, 09 Sep 2012 02:31:45 +0000
Subject: Re: [signal:master 62/63] arch/m68k/kernel/entry.S:115: Error: operands mismatch -- statement `movem
Message-Id: <20120909023145.GL13973@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908135733.GA25549@localhost>
In-Reply-To: <20120908135733.GA25549@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 09, 2012 at 12:28:17AM +0800, Fengguang Wu wrote:
> > On which toolchain?  It had been a valid instruction on all m68k, starting with
> > 68000.  Is that as(1) insisting on %sp@+ form instead of (%sp)+?  But we have
> > both kinds used in arch/m68k, so if some toolchain version barfs on that, it's
> > probably rather unhappy elsewhere...

Hrrrm....  Looks like it's an effect of weird addressing modes being
somewhat trimmed down on coldfire...  So these lines should become
something like
        moveml  4(%sp), %d1-%d2 
        moveq   #PT_SIZEOF,%d3
        moveml  %d1-%d3,(%sp)   | we are not returning anyway...

With that it still works on aranym and AFAICS those forms should be acceptable
on anything, including all coldfire variants...  As far as I can see, all
places using increment/decrement forms of movem (essentially, bulk push/pop
on arbitrary set of registers) are in the code that never gets touched on
coldfire and non-MMU builds; the only potential exception is non-assembler
variant of SAVE_ALL_INT (#define SAVE_ALL_INT .... in asm/entry.h), but that
macro is never actually used anywhere in C code.

OK, folded and pushed.  Should be on git.kernel.org shortly...
