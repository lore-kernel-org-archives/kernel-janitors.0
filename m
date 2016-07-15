From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 21:08:36 +0000
Subject: [patch 2/2] perf jit: remove some no-op error handling
Message-Id: <20160715210836.GB19522@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Stephane Eranian <eranian@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

info.e_machine is a uint16_t so m is never less than zero.  It looks
like this was maybe left over code from earlier versions so I've just
removed it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 91bf333..55daeff 100644
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
