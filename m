From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:18:42 +0000
Subject: [patch] dlm: le32 vs le16
Message-Id: <20120104071842.GB30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

->rf_our_slot and ->rf_num_slots are le16 so we should use cpu_to_le16()
here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 8f5a1b2..ac5c616 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -89,8 +89,8 @@ static void set_rcom_config(struct dlm_ls *ls, struct rcom_config *rf,
 	rf->rf_lvblen = cpu_to_le32(ls->ls_lvblen);
 	rf->rf_lsflags = cpu_to_le32(ls->ls_exflags);
 
-	rf->rf_our_slot = cpu_to_le32(ls->ls_slot);
-	rf->rf_num_slots = cpu_to_le32(num_slots);
+	rf->rf_our_slot = cpu_to_le16(ls->ls_slot);
+	rf->rf_num_slots = cpu_to_le16(num_slots);
 	rf->rf_generation =  cpu_to_le32(ls->ls_generation);
 }
 
