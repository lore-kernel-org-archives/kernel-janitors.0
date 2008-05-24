From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 24 May 2008 18:52:01 +0000
Subject: Re: some numbers on macros
Message-Id: <20080524185201.GZ2638@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805241748.19607.m.kozlowski@tuxland.pl> <20080524093350.60e6dc8d@infradead.org>
In-Reply-To: <20080524093350.60e6dc8d@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan@infradead.org>
Cc: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 24, 2008 at 09:33:50AM -0700, Arjan van de Ven wrote:
> unused macros in common header files are an indication of stale APIs
> otoh.. and might be of some interest. (Same for static inline in
> headers)

Possibly.  There's likely to be a lot of macros unused like these ones:

#define  PCI_X_CMD_MAX_READ     0x000c  /* Max Memory Read Byte Count */
                                /* Max # of outstanding split transactions */
#define  PCI_X_CMD_SPLIT_1      0x0000  /* Max 1 */
#define  PCI_X_CMD_SPLIT_2      0x0010  /* Max 2 */
#define  PCI_X_CMD_SPLIT_3      0x0020  /* Max 3 */
...

where the macros embody the PCI specification in code -- possibly we
don't use them yet, but if we ever did, we'd have the macros to use.

Another category of false positive is macros that ought to be used,
but the code that ought to be using them has decided to go its own way.
That still indicates a bug, but not the one you might initially think.

In summary, this is probably an interesting exercise, but the results
would need to be interpreted with care.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
