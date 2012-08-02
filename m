From: David Howells <dhowells@redhat.com>
Date: Thu, 02 Aug 2012 17:48:08 +0000
Subject: Re: [uapi:uapi-split 11/74] included file 'asm-s390/kvm.h' is not exported
Message-Id: <13411.1343929688@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120802144410.GA26515@localhost>
In-Reply-To: <20120802144410.GA26515@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-split
> head:   dfdba2d2ec686d5b0b1e0f9e62c436f53623e5f1
> commit: 3977634defc82b0e4a0d705479d876bd61982bd3 [11/74] UAPI: Remove the objhdr-y export list
> config: s390-allmodconfig (attached as .config)
> 
> Build errors:
> 
> /c/kernel-tests/obj/s390/s390-allmodconfig/usr/include/linux/kvm.h:13: included file 'asm-s390/kvm.h' is not exported
> /c/kernel-tests/obj/s390/s390-allmodconfig/usr/include/linux/kvm_para.h:26: included file 'asm-s390/kvm_para.h' is not exported

Thanks!

There was a fix in patch 13 for this.  I'm moving it to patch 9.  That seems
to work.

David
