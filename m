From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:51:46 +0000
Subject: [patch] ghes_edac: use snprintf to make static checkers happy
Message-Id: <20130430074637.GG7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The destination buffer "pvt->detail_location" is 240 bytes.
e->location is 80 bytes. e->other_detail is a pointer to
pvt->other_detail which is 160 bytes.  Then when we add in the prefix
"APEI location: " we've gone over 240 bytes.

We can't actually hit the max but we may as well use snprintf() and
silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index bb53467..b94d762 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -403,8 +403,8 @@ void ghes_edac_report_mem_error(struct ghes *ghes, int sev,
 
 	/* Generate the trace event */
 	grain_bits = fls_long(e->grain);
-	sprintf(pvt->detail_location, "APEI location: %s %s",
-		e->location, e->other_detail);
+	snprintf(pvt->detail_location, sizeof(pvt->detail_location),
+		 "APEI location: %s %s", e->location, e->other_detail);
 	trace_mc_event(type, e->msg, e->label, e->error_count,
 		       mci->mc_idx, e->top_layer, e->mid_layer, e->low_layer,
 		       PAGES_TO_MiB(e->page_frame_number) | e->offset_in_page,
