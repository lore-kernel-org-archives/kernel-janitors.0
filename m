From: David Howells <dhowells@redhat.com>
Date: Sun, 22 Jul 2012 09:28:20 +0000
Subject: Re: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <23199.1342949300@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hmmm...  I'm not sure this is something I've introduced.  I can't actually
build IA-64 anyway, even without patches:

include/linux/sched.h: In function 'stack_not_used':
include/linux/sched.h:2517:21: error: 'IA64_TASK_SIZE' undeclared (first use in this function)
include/linux/sched.h:2517:21: note: each undeclared identifier is reported only once for each function it appears in
include/linux/sched.h:2517:21: error: 'IA64_THREAD_INFO_SIZE' undeclared (first use in this function

Do you have more success?

David
