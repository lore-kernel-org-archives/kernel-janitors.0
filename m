From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Nov 2019 14:33:09 +0000
Subject: [PATCH v2 -next] ptp: ptp_clockmatrix: Fix missing unlock on error in idtcm_probe()
Message-Id: <20191106143309.123196-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106115308.112645-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106115308.112645-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>, Vincent Cheng <vincent.cheng.xh@renesas.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function idtcm_probe()
in the error handling case.

Fixes: 3a6ba7dc7799 ("ptp: Add a ptp clock driver for IDT ClockMatrix.")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Vincent Cheng <vincent.cheng.xh@renesas.com>
---
v1 -> v2: fix prefix of subject
---
 drivers/ptp/ptp_clockmatrix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_clockmatrix.c b/drivers/ptp/ptp_clockmatrix.c
index cf5889b7d825..a5110b7b4ece 100644
--- a/drivers/ptp/ptp_clockmatrix.c
+++ b/drivers/ptp/ptp_clockmatrix.c
@@ -1294,8 +1294,10 @@ static int idtcm_probe(struct i2c_client *client,
 
 	err = set_tod_write_overhead(idtcm);
 
-	if (err)
+	if (err) {
+		mutex_unlock(&idtcm->reg_lock);
 		return err;
+	}
 
 	err = idtcm_load_firmware(idtcm, &client->dev);
