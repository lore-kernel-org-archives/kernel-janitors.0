From: Slawomir Stepien <sst@poczta.fm>
Date: Thu, 14 Apr 2016 19:36:34 +0000
Subject: [PATCH 02/10] iio: inkern: add a missing space before if
Message-Id: <1460662602-2951-3-git-send-email-sst@poczta.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-1-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, Slawomir Stepien <sst@poczta.fm>

This fixes the error reported by checkpatch.pl:

ERROR: space required before the open parenthesis '('

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/iio/inkern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 734a004..2fc7928 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -452,7 +452,7 @@ static int iio_channel_read(struct iio_channel *chan, int *val, int *val2,
 	if (val2 = NULL)
 		val2 = &unused;
 
-	if(!iio_channel_has_info(chan->channel, info))
+	if (!iio_channel_has_info(chan->channel, info))
 		return -EINVAL;
 
 	if (chan->indio_dev->info->read_raw_multi) {
-- 
2.8.0

