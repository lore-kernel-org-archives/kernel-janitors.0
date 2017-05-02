From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 17:46:53 +0000
Subject: [PATCH 1/3] net/atm: Combine four seq_printf() calls in mpc_show()
Message-Id: <c540d391-251e-a4bb-5701-a86319f7f88b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9577c1f-07d1-b43a-df16-8626acfb1043@users.sourceforge.net>
In-Reply-To: <d9577c1f-07d1-b43a-df16-8626acfb1043@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 18:52:58 +0200

Some data were put into a sequence by four separate function calls.
Print the same data by two function calls instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/atm/mpoa_proc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/atm/mpoa_proc.c b/net/atm/mpoa_proc.c
index 2df34eb5d65f..6ea6028fd865 100644
--- a/net/atm/mpoa_proc.c
+++ b/net/atm/mpoa_proc.c
@@ -145,8 +145,8 @@ static int mpc_show(struct seq_file *m, void *v)
 		return 0;
 	}
 
-	seq_printf(m, "\nInterface %d:\n\n", mpc->dev_num);
-	seq_printf(m, "Ingress Entries:\nIP address      State      Holding time  Packets fwded  VPI  VCI\n");
+	seq_printf(m, "\nInterface %d:\n\nIngress Entries:\nIP address      State      Holding time  Packets fwded  VPI  VCI\n",
+		   mpc->dev_num);
 	do_gettimeofday(&now);
 
 	for (in_entry = mpc->in_cache; in_entry; in_entry = in_entry->next) {
@@ -165,7 +165,7 @@ static int mpc_show(struct seq_file *m, void *v)
 	}
 
-	seq_printf(m, "\n");
-	seq_printf(m, "Egress Entries:\nIngress MPC ATM addr\nCache-id        State      Holding time  Packets recvd  Latest IP addr   VPI VCI\n");
+	seq_printf(m,
+		   "\nEgress Entries:\nIngress MPC ATM addr\nCache-id        State      Holding time  Packets recvd  Latest IP addr   VPI VCI\n");
 	for (eg_entry = mpc->eg_cache; eg_entry; eg_entry = eg_entry->next) {
 		unsigned char *p = eg_entry->ctrl_info.in_MPC_data_ATM_addr;
 		for (i = 0; i < ATM_ESA_LEN; i++)
-- 
2.12.2

