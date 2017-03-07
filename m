From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Mar 2017 15:06:31 +0000
Subject: [PATCH] iio: multiplexer: fix unsigned check with less than zero
Message-Id: <20170307150631.31043-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Comparing a size_t with less than zero is always false as size_t
is unsigned. The intent of the comparison was to check if the size
was -1 (that is, undefined), so use that instead.

Detected by CoverityScan, CID#1415278 ("Unsigned compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/multiplexer/iio-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/multiplexer/iio-mux.c b/drivers/iio/multiplexer/iio-mux.c
index 94d40f9b..6c23033 100644
--- a/drivers/iio/multiplexer/iio-mux.c
+++ b/drivers/iio/multiplexer/iio-mux.c
@@ -61,7 +61,7 @@ static int iio_mux_select(struct mux *mux, int idx)
 
 			cache = &child->ext_info_cache[i];
 
-			if (cache->size < 0)
+			if (cache->size = (size_t)-1)
 				continue;
 
 			ret = iio_write_channel_ext_info(mux->parent, attr,
-- 
2.10.2

