From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 11:16:00 +0000
Subject: [PATCH] media: dvb: remove redundant assignment to variable bw
Message-Id: <20200424111600.11991-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable bw is being initialized with a value that is
never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index f87e27481ea7..d5b1b3788e39 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -685,7 +685,7 @@ static int cxd2880_set_ber_per_period_t(struct dvb_frontend *fe)
 	int ret;
 	struct cxd2880_priv *priv;
 	struct cxd2880_dvbt_tpsinfo info;
-	enum cxd2880_dtv_bandwidth bw = CXD2880_DTV_BW_1_7_MHZ;
+	enum cxd2880_dtv_bandwidth bw;
 	u32 pre_ber_rate = 0;
 	u32 post_ber_rate = 0;
 	u32 ucblock_rate = 0;
-- 
2.25.1
