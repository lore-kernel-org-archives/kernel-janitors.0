From: David Howells <dhowells@redhat.com>
Date: Fri, 20 Jul 2012 14:28:07 +0000
Subject: Re: [modsign:devel-x509 19/19] gcc: error: security/keys/crypto/x509-asn1.c: No such file or directo
Message-Id: <7577.1342794487@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> Kernel build failed somewhere in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git devel-x509
> head:   60e96ee932ebebf7c93f36b72475a12af7b0bc4e
> config: x86_64-allmodconfig (attached as .config)
> 
> Build errors:
> 
> gcc: error: security/keys/crypto/x509-asn1.c: No such file or directory
> gcc: error: security/keys/crypto/x509_rsakey-asn1.c: No such file or directory
> Can't open perl script "lib/build_OID_registry": No such file or directory

I can't reproduce this.  The lib/build_OID_registry error is particularly odd
as the patches are clearly adding and modifying it.  Are you building into a
separate directory to the source tree?

David
