From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Feb 2021 11:56:24 +0000
Subject: [PATCH] doc/admin-guide: fix spelling mistake: "perfomance" -> "performance"
Message-Id: <20210210115624.53551-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Alexey Budankov <alexey.budankov@linux.intel.com>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the perf-security documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/admin-guide/perf-security.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf-security.rst b/Documentation/admin-guide/perf-security.rst
index 904e4eb37f99..34aa334320ca 100644
--- a/Documentation/admin-guide/perf-security.rst
+++ b/Documentation/admin-guide/perf-security.rst
@@ -72,7 +72,7 @@ monitoring and observability operations, thus, bypass *scope* permissions
 checks in the kernel. CAP_PERFMON implements the principle of least
 privilege [13]_ (POSIX 1003.1e: 2.2.2.39) for performance monitoring and
 observability operations in the kernel and provides a secure approach to
-perfomance monitoring and observability in the system.
+performance monitoring and observability in the system.
 
 For backward compatibility reasons the access to perf_events monitoring and
 observability operations is also open for CAP_SYS_ADMIN privileged
-- 
2.30.0
