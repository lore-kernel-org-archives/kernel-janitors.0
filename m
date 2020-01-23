From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 09:19:54 +0000
Subject: [PATCH][V2] iio: ad5755: fix spelling mistake "to" -> "too" and grammar
Message-Id: <20200123091954.10506-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake and grammar mistake in a dev_err
message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: fix grammar too, thanks to Alexandru Ardelean for spotting this.
---
 drivers/iio/dac/ad5755.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
index b9175fb4c8ab..1359a1a92fdc 100644
--- a/drivers/iio/dac/ad5755.c
+++ b/drivers/iio/dac/ad5755.c
@@ -655,7 +655,7 @@ static struct ad5755_platform_data *ad5755_parse_dt(struct device *dev)
 	for_each_child_of_node(np, pp) {
 		if (devnr >= AD5755_NUM_CHANNELS) {
 			dev_err(dev,
-				"There is to many channels defined in DT\n");
+				"There are too many channels defined in DT\n");
 			goto error_out;
 		}
 
-- 
2.24.0
