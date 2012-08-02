From: David Howells <dhowells@redhat.com>
Date: Thu, 02 Aug 2012 17:56:41 +0000
Subject: Re: [uapi:uapi-split 11/74] included file 'asm-m68k/a.out.h' is not exported
Message-Id: <5226.1343930201@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120802144410.GA26515@localhost>
In-Reply-To: <20120802144410.GA26515@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> Kernel build failed on
> 
> tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-split
> head:   dfdba2d2ec686d5b0b1e0f9e62c436f53623e5f1
> commit: 3977634defc82b0e4a0d705479d876bd61982bd3 [11/74] UAPI: Remove the objhdr-y export list
> config: m68k-allmodconfig (attached as .config)
> 
> Build errors:
> 
> usr/include/linux/a.out.h:8: included file 'asm-m68k/a.out.h' is not exported

This is the same thing as the s390 bug.

David
