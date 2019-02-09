From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Feb 2019 09:03:52 +0000
Subject: [PATCH] iio: chemical: sps30: fix a loop timeout test
Message-Id: <20190209090350.GD4865@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Tomasz Duszynski <tduszyns@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

The "while (tries--) {" loop is a postop so it exits with "tries" set
to -1.

Fixes: 232e0f6ddeae ("iio: chemical: add support for Sensirion SPS30 sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iio/chemical/sps30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
index e03a28a67146..375df5060ed5 100644
--- a/drivers/iio/chemical/sps30.c
+++ b/drivers/iio/chemical/sps30.c
@@ -210,7 +210,7 @@ static int sps30_do_meas(struct sps30_state *state, s32 *data, int size)
 		msleep_interruptible(300);
 	}
 
-	if (!tries)
+	if (tries = -1)
 		return -ETIMEDOUT;
 
 	ret = sps30_do_cmd(state, SPS30_READ_DATA, tmp, sizeof(int) * size);
-- 
2.17.1
