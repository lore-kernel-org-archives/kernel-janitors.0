From: Peter Rosin <peda@axentia.se>
Date: Wed, 08 Mar 2017 13:28:18 +0000
Subject: [PATCH v2] iio: multiplexer: fix unsigned check with less than zero
Message-Id: <1488979698-12545-1-git-send-email-peda@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <687fdd3a-4e0d-1eda-e8fc-27173c611909@canonical.com>
In-Reply-To: <687fdd3a-4e0d-1eda-e8fc-27173c611909@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>

Comparing a size_t with less than zero is always false as size_t
is unsigned. So, change the type of the variable to ssize_t and
replicate the size check from mux_configure_channel() into
mux_write_ext_info() thus ensuring that the size will fit in the
ssize_t variable.

Detected by CoverityScan, CID#1415278 ("Unsigned compared against 0")

Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/iio/multiplexer/iio-mux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Hi!

Here's what intend to queue up.

Cheers,
peda

diff --git a/drivers/iio/multiplexer/iio-mux.c b/drivers/iio/multiplexer/iio-mux.c
index 94d40f9b..bab9e69 100644
--- a/drivers/iio/multiplexer/iio-mux.c
+++ b/drivers/iio/multiplexer/iio-mux.c
@@ -21,7 +21,7 @@
 
 struct mux_ext_info_cache {
 	char *data;
-	size_t size;
+	ssize_t size;
 };
 
 struct mux_child {
@@ -206,6 +206,9 @@ static ssize_t mux_write_ext_info(struct iio_dev *indio_dev, uintptr_t private,
 	char *new;
 	ssize_t ret;
 
+	if (len >= PAGE_SIZE)
+		return -EINVAL;
+
 	ret = iio_mux_select(mux, idx);
 	if (ret < 0)
 		return ret;
-- 
2.1.4

