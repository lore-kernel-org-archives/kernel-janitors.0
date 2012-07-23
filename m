From: David Howells <dhowells@redhat.com>
Date: Mon, 23 Jul 2012 21:49:53 +0000
Subject: Re: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <4632.1343080193@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23199.1342949300@warthog.procyon.org.uk>
In-Reply-To: <23199.1342949300@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Luck, Tony <tony.luck@intel.com> wrote:

> Probably longer than that ... the paravirt folks did a drive-by dump of
> a lot of code & macros into ia64 ... and then disappeared leaving their
> changes to bitrot :-(

Is it worth marking config PARAVIRT dependent on !IA64 so that
allyes/modconfig builds work?

David
