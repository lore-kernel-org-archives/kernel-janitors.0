From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jun 2015 16:24:09 +0000
Subject: [PATCH 2/2] perf header: Less function calls in read_event_desc() after error detection
Message-Id: <558C2B29.8030005@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <558C29E1.2040909@users.sourceforge.net>
In-Reply-To: <558C29E1.2040909@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jun 2015 17:50:37 +0200

The functions "free" and "free_event_desc" were called in a few cases by the
function "read_event_desc" during error handling even if the passed variable
contained a null pointer.

This implementation detail could be improved by the adjustment of jump targets.
Drop unnecessary initialisations for the variables "buf" and "events" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/perf/util/header.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 03ace57..8071163 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -978,9 +978,9 @@ static void free_event_desc(struct perf_evsel *events)
 static struct perf_evsel *
 read_event_desc(struct perf_header *ph, int fd)
 {
-	struct perf_evsel *evsel, *events = NULL;
+	struct perf_evsel *evsel, *events;
 	u64 *id;
-	void *buf = NULL;
+	void *buf;
 	u32 nre, sz, nr, i, j;
 	ssize_t ret;
 	size_t msz;
@@ -988,14 +988,14 @@ read_event_desc(struct perf_header *ph, int fd)
 	/* number of events */
 	ret = readn(fd, &nre, sizeof(nre));
 	if (ret != (ssize_t)sizeof(nre))
-		goto error;
+		return NULL;
 
 	if (ph->needs_swap)
 		nre = bswap_32(nre);
 
 	ret = readn(fd, &sz, sizeof(sz));
 	if (ret != (ssize_t)sizeof(sz))
-		goto error;
+		return NULL;
 
 	if (ph->needs_swap)
 		sz = bswap_32(sz);
@@ -1003,12 +1003,12 @@ read_event_desc(struct perf_header *ph, int fd)
 	/* buffer to hold on file attr struct */
 	buf = malloc(sz);
 	if (!buf)
-		goto error;
+		return NULL;
 
 	/* the last event terminates with evsel->attr.size = 0: */
 	events = calloc(nre + 1, sizeof(*events));
 	if (!events)
-		goto error;
+		goto free_buffer;
 
 	msz = sizeof(evsel->attr);
 	if (sz < msz)
@@ -1023,7 +1023,7 @@ read_event_desc(struct perf_header *ph, int fd)
 		 */
 		ret = readn(fd, buf, sz);
 		if (ret != (ssize_t)sz)
-			goto error;
+			goto free_events;
 
 		if (ph->needs_swap)
 			perf_event__attr_swap(buf);
@@ -1032,7 +1032,7 @@ read_event_desc(struct perf_header *ph, int fd)
 
 		ret = readn(fd, &nr, sizeof(nr));
 		if (ret != (ssize_t)sizeof(nr))
-			goto error;
+			goto free_events;
 
 		if (ph->needs_swap) {
 			nr = bswap_32(nr);
@@ -1046,26 +1046,27 @@ read_event_desc(struct perf_header *ph, int fd)
 
 		id = calloc(nr, sizeof(*id));
 		if (!id)
-			goto error;
+			goto free_events;
 		evsel->ids = nr;
 		evsel->id = id;
 
 		for (j = 0 ; j < nr; j++) {
 			ret = readn(fd, id, sizeof(*id));
 			if (ret != (ssize_t)sizeof(*id))
-				goto error;
+				goto free_events;
 			if (ph->needs_swap)
 				*id = bswap_64(*id);
 			id++;
 		}
 	}
-out:
+
 	free(buf);
 	return events;
-error:
+free_events:
 	free_event_desc(events);
-	events = NULL;
-	goto out;
+free_buffer:
+	free(buf);
+	return NULL;
 }
 
 static int __desc_attr__fprintf(FILE *fp, const char *name, const char *val,
-- 
2.4.4

