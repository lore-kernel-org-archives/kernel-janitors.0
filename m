From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 09 May 2020 07:32:58 +0000
Subject: [PATCH] MAINTAINERS: adjust to livepatch .klp.arch removal
Message-Id: <20200509073258.5970-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>, Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 1d05334d2899 ("livepatch: Remove .klp.arch") removed
arch/x86/kernel/livepatch.c, but missed to adjust the LIVE PATCHING entry
in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  arch/x86/kernel/livepatch.c

So, drop that obsolete file entry in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Jiri, please take this minor non-urgent patch for livepatching/for-next.
Peter, please ack.

applies cleanly on next-20200508

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92657a132417..642f55c4b556 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9909,7 +9909,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.g
 F:	Documentation/ABI/testing/sysfs-kernel-livepatch
 F:	Documentation/livepatch/
 F:	arch/x86/include/asm/livepatch.h
-F:	arch/x86/kernel/livepatch.c
 F:	include/linux/livepatch.h
 F:	kernel/livepatch/
 F:	samples/livepatch/
-- 
2.17.1
