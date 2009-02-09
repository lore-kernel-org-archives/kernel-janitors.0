From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 22:09:32 +0000
Subject: [PATCH] trace: Storage class should be before const qualifier
Message-Id: <20090209220932.GA8220@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 kernel/trace/trace_sysprof.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/trace/trace_sysprof.c b/kernel/trace/trace_sysprof.c
index eaca5ad..1883221 100644
--- a/kernel/trace/trace_sysprof.c
+++ b/kernel/trace/trace_sysprof.c
@@ -88,7 +88,7 @@ static void backtrace_address(void *data, unsigned long addr, int reliable)
 	}
 }
 
-const static struct stacktrace_ops backtrace_ops = {
+static const struct stacktrace_ops backtrace_ops = {
 	.warning		= backtrace_warning,
 	.warning_symbol		= backtrace_warning_symbol,
 	.stack			= backtrace_stack,
-- 
1.5.6.5

