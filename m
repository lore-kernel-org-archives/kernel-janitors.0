From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Nov 2011 06:28:52 +0000
Subject: [patch] edac: sb_edac: add sanity check to silence static checker
Message-Id: <20111101062852.GA19020@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: "Mark A. Grondona" <mgrondona@llnl.gov>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I assume the the check on if (limit <= prv) prevents n_tads from
actually reaching MAX_TAD.  The problem with that is that it relies
on the hardware returning the right value and Smatch complains that
if it doesn't we could have a buffer overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Feel free to ignore this patch if you want.  I don't have very stong
feelings about this either way.

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 7a402bf..ebf386c 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -970,6 +970,12 @@ static int get_memory_error_data(struct mem_ctl_info *mci,
 			break;
 		prv = limit;
 	}
+	if (n_tads = MAX_TAD) {
+		sprintf(msg, "Could not discover the memory channel");
+		edac_mc_handle_ce_no_info(mci, msg);
+		return -EINVAL;
+	}
+
 	ch_way = TAD_CH(reg) + 1;
 	sck_way = TAD_SOCK(reg) + 1;
 	/*
