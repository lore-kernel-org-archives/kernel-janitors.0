From: David Howells <dhowells@redhat.com>
Date: Fri, 20 Jul 2012 14:26:03 +0000
Subject: Re: [modsign:devel-x509 18/19] lib/asn1_decoder.c:183:11: error: 'EMSGSIZE' undeclared (first use in
Message-Id: <7546.1342794363@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> lib/asn1_decoder.c: In function 'asn1_ber_decoder':
> lib/asn1_decoder.c:183:11: error: 'EMSGSIZE' undeclared (first use in this function)
> ...

Fixed.

David
