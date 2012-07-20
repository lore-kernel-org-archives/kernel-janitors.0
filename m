From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 20 Jul 2012 14:37:07 +0000
Subject: Re: [modsign:devel-x509 19/19] gcc: error: security/keys/crypto/x509-asn1.c: No such file or directo
Message-Id: <20120720143707.GA8096@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7577.1342794487@warthog.procyon.org.uk>
In-Reply-To: <7577.1342794487@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 20, 2012 at 03:28:07PM +0100, David Howells wrote:
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> 
> > Kernel build failed somewhere in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git devel-x509
> > head:   60e96ee932ebebf7c93f36b72475a12af7b0bc4e
> > config: x86_64-allmodconfig (attached as .config)
> > 
> > Build errors:
> > 
> > gcc: error: security/keys/crypto/x509-asn1.c: No such file or directory
> > gcc: error: security/keys/crypto/x509_rsakey-asn1.c: No such file or directory
> > Can't open perl script "lib/build_OID_registry": No such file or directory
> 
> I can't reproduce this.  The lib/build_OID_registry error is particularly odd
> as the patches are clearly adding and modifying it.  Are you building into a
> separate directory to the source tree?

I just reproduced it.  Yes I used KBUILD_OUTPUT.

Just in case it matters: my gcc version is 4.7.1 (Debian 4.7.1-5).

Thanks,
Fengguang
