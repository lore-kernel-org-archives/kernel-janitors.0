From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jul 2015 21:27:07 +0000
Subject: [patch] tpm: remove a duplicate condition
Message-Id: <20150729212707.GA21784@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We just checked if "event->event_type = 0 && event->event_size = 0" on
the line before so we don't need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/tpm/tpm_eventlog.c b/drivers/char/tpm/tpm_eventlog.c
index 3a56a13..c20996b 100644
--- a/drivers/char/tpm/tpm_eventlog.c
+++ b/drivers/char/tpm/tpm_eventlog.c
@@ -119,8 +119,7 @@ static void *tpm_bios_measurements_next(struct seq_file *m, void *v,
 	if (event->event_type = 0 && event->event_size = 0)
 		return NULL;
 
-	if ((event->event_type = 0 && event->event_size = 0) ||
-	    ((v + sizeof(struct tcpa_event) + event->event_size) >= limit))
+	if (v + sizeof(struct tcpa_event) + event->event_size >= limit)
 		return NULL;
 
 	(*pos)++;
