From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 18 Jul 2016 23:33:05 +0000
Subject: [PATCH 02/15] perf jit: Remove some no-op error handling
Message-Id: <1468884798-14932-3-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468884798-14932-1-git-send-email-acme@kernel.org>
In-Reply-To: <1468884798-14932-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Stephane Eranian <eranian@google.com>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Dan Carpenter <dan.carpenter@oracle.com>

The 'info.e_machine' struct member is an uint16_t so 'm' is never less
than zero.  It looks like this was maybe left over code from earlier
versions so I've just removed it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/20160715210836.GB19522@mwanda
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/jvmti/jvmti_agent.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 91bf333a366a..55daefff0d54 100644
--- a/tools/perf/jvmti/jvmti_agent.c
+++ b/tools/perf/jvmti/jvmti_agent.c
@@ -59,7 +59,6 @@ static int get_e_machine(struct jitheader *hdr)
 	ssize_t sret;
 	char id[16];
 	int fd, ret = -1;
-	int m = -1;
 	struct {
 		uint16_t e_type;
 		uint16_t e_machine;
@@ -81,11 +80,7 @@ static int get_e_machine(struct jitheader *hdr)
 	if (sret != sizeof(info))
 		goto error;
 
-	m = info.e_machine;
-	if (m < 0)
-		m = 0; /* ELF EM_NONE */
-
-	hdr->elf_mach = m;
+	hdr->elf_mach = info.e_machine;
 	ret = 0;
 error:
 	close(fd);
-- 
2.7.4

