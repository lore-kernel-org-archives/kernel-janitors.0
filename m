From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 14 May 2020 21:45:04 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to livepatch .klp.arch removal
Message-Id: <nycvar.YFH.7.76.2005142344230.25812@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509073258.5970-1-lukas.bulwahn@gmail.com> <bfe91b2d-e319-bf12-6a15-4f200d0e8ea4@linux.vnet.ibm.com>
In-Reply-To: <bfe91b2d-e319-bf12-6a15-4f200d0e8ea4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 9 May 2020, Kamalesh Babulal wrote:

> > Commit 1d05334d2899 ("livepatch: Remove .klp.arch") removed
> > arch/x86/kernel/livepatch.c, but missed to adjust the LIVE PATCHING entry
> > in MAINTAINERS.
> > 
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches  F:  arch/x86/kernel/livepatch.c
> > 
> > So, drop that obsolete file entry in MAINTAINERS.
> 
> Patch looks good to me,  you probably want to add following architecture
> specific livepatching header files to the list:
> 
> arch/s390/include/asm/livepatch.h
> arch/powerpc/include/asm/livepatch.h

Good point, thanks for spotting it Kamalesh. I've queued the patch below 
on top.



From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] livepatch: add arch-specific headers to MAINTAINERS

Add arch-specific livepatch.h for s390 and powerpc to MAINTAINERS
F: patterns.

Reported-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0827670425..8e14444eb98d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9854,6 +9854,8 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git
 F:	Documentation/ABI/testing/sysfs-kernel-livepatch
 F:	Documentation/livepatch/
+F:	arch/powerpc/include/asm/livepatch.h
+F:	arch/s390/include/asm/livepatch.h
 F:	arch/x86/include/asm/livepatch.h
 F:	include/linux/livepatch.h
 F:	kernel/livepatch/


-- 
Jiri Kosina
SUSE Labs
