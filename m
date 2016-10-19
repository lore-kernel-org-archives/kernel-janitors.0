From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 20:46:38 +0000
Subject: [PATCH 1/5] blackfin-cplbinfo: Use seq_puts() in cplbinfo_print_header()
Message-Id: <953f3618-bc1a-db92-0ce6-b4ab967adf54@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
In-Reply-To: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 21:00:10 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/kernel/cplbinfo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/blackfin/kernel/cplbinfo.c b/arch/blackfin/kernel/cplbinfo.c
index 5b80d59..991d9d3 100644
--- a/arch/blackfin/kernel/cplbinfo.c
+++ b/arch/blackfin/kernel/cplbinfo.c
@@ -36,7 +36,8 @@ struct cplbinfo_data {
 
 static void cplbinfo_print_header(struct seq_file *m)
 {
-	seq_printf(m, "Index\tAddress\t\tData\tSize\tU/RD\tU/WR\tS/WR\tSwitch\n");
+	seq_puts(m,
+		 "Index\tAddress\t\tData\tSize\tU/RD\tU/WR\tS/WR\tSwitch\n");
 }
 
 static int cplbinfo_nomore(struct cplbinfo_data *cdata)
-- 
2.10.1

