From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:42:46 +0000
Subject: [PATCH] media: vidtv: fix use after free in vidtv_channel_si_destroy()
Message-Id: <X8ilBh7cBIqSpP6Y@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This code frees "m->si.pat" and then dereferences it on the next line.

Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 8ad6c0744d36..7838e6272712 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -504,11 +504,11 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 {
 	u32 i;
 
-	vidtv_psi_pat_table_destroy(m->si.pat);
-
 	for (i = 0; i < m->si.pat->num_pmt; ++i)
 		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
 
+	vidtv_psi_pat_table_destroy(m->si.pat);
+
 	kfree(m->si.pmt_secs);
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
 	vidtv_psi_nit_table_destroy(m->si.nit);
-- 
2.29.2
