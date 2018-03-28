From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Mar 2018 23:18:53 +0000
Subject: [PATCH] atm: iphase: fix spelling mistake: "Receiverd" -> "Received"
Message-Id: <20180328231853.28461-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/iphase.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 98a3a43484c8..44abb8a0a5e5 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -3147,7 +3147,7 @@ static int ia_proc_read(struct atm_dev *dev,loff_t *pos,char *page)
                            "  Size of Tx Buffer  :  %u\n"
                            "  Number of Rx Buffer:  %u\n"
                            "  Size of Rx Buffer  :  %u\n"
-                           "  Packets Receiverd  :  %u\n"
+                           "  Packets Received   :  %u\n"
                            "  Packets Transmitted:  %u\n"
                            "  Cells Received     :  %u\n"
                            "  Cells Transmitted  :  %u\n"
-- 
2.15.1

