From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Nov 2020 13:28:32 +0000
Subject: [PATCH][next] media: vidtv: fix a read from an object after it has been freed
Message-Id: <20201127132832.15239-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the call to vidtv_psi_pat_table_destroy frees the object
m->si.pat however m->si.pat->num_pmt is being accessed after the
free.  Fix this by destroying m->si.pat after the m->si.pmt_secs[]
objects have been freed.

Addresses-Coverity: ("Read from pointer after free")
Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
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
