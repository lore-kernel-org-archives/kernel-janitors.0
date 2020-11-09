From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 09 Nov 2020 12:22:50 +0000
Subject: [PATCH] MAINTAINERS: assign ./fs/tracefs to TRACING
Message-Id: <20201109122250.31915-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

A check with ./scripts/get_maintainer.pl --letters -f fs/tracefs/ shows
that the tracefs is not assigned to the TRACING section in MAINTAINERS.

Add the file pattern for the TRACING section to rectify that.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.10-rc3 and next-20201109

Steven, Ingo, please pick this minor non-urgent clean-up patch.


By the way, I am wondering if the git tree is still up to date?

It says for TRACING:
  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core

But I assume commits now actually travel through:
  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cba8ddf87a08..f0ba51f2c759 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17823,6 +17823,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
 F:	Documentation/trace/ftrace.rst
 F:	arch/*/*/*/ftrace.h
 F:	arch/*/kernel/ftrace.c
+F:	fs/tracefs/
 F:	include/*/ftrace.h
 F:	include/linux/trace*.h
 F:	include/trace/
-- 
2.17.1
