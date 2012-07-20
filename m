From: David Howells <dhowells@redhat.com>
Date: Fri, 20 Jul 2012 14:52:59 +0000
Subject: Re: [modsign:devel-x509 19/19] gcc: error: security/keys/crypto/x509-asn1.c: No such file or directo
Message-Id: <8055.1342795979@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7577.1342794487@warthog.procyon.org.uk>
In-Reply-To: <7577.1342794487@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> > I can't reproduce this.  The lib/build_OID_registry error is particularly
> > odd as the patches are clearly adding and modifying it.  Are you building
> > into a separate directory to the source tree?
> 
> I just reproduced it.  Yes I used KBUILD_OUTPUT.

"make O=foo" does show it for me.  I've fixed the *-asn1.c not found problem,
now to work on the build_OID_registry problem.

It seems $(obj) doesn't contain what I thought it did.

David
