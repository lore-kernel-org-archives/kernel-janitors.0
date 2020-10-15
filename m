From: Fedor Tokarev <ftokarev@gmail.com>
Date: Thu, 15 Oct 2020 14:30:04 +0000
Subject: [PATCH] tools: net: traceevent: Fix 'snprintf' return value check in 'tep_filter_strerror'
Message-Id: <20201015142959.GA18281@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org, acme@redhat.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ftokarev@gmail.com

'snprintf' returns the number of characters which would have been written
if enough space had been available, excluding the terminating null byte.
Thus, the return value of 'buflen' means that the last character
was dropped.

Signed-off-by: Fedor Tokarev <ftokarev@gmail.com>
---
 tools/lib/traceevent/parse-filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/traceevent/parse-filter.c b/tools/lib/traceevent/parse-filter.c
index c271aee..dccdbf2 100644
--- a/tools/lib/traceevent/parse-filter.c
+++ b/tools/lib/traceevent/parse-filter.c
@@ -1374,7 +1374,7 @@ int tep_filter_strerror(struct tep_event_filter *filter, enum tep_errno err,
 	if (strlen(filter->error_buffer) > 0) {
 		size_t len = snprintf(buf, buflen, "%s", filter->error_buffer);
 
-		if (len > buflen)
+		if (len >= buflen)
 			return -1;
 		return 0;
 	}
-- 
2.7.4
