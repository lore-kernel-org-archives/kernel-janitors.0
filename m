From: David Howells <dhowells@redhat.com>
Date: Wed, 03 Oct 2012 14:43:57 +0000
Subject: Re: [uapi:uapi-split 44/75] include/linux/projid.h:17:30: error: storage class specified for paramet
Message-Id: <25469.1349275437@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003132913.GA4731@localhost>
In-Reply-To: <20121003132913.GA4731@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Bah.

In asm-generic/unistd.h, someone put a guard on the header file that I wasn't
expecting:

	#if !defined(_ASM_GENERIC_UNISTD_H) || defined(__SYSCALL)

and so my script can't deal with it.

David
