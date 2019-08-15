From: Colin King <colin.king@canonical.com>
Date: Thu, 15 Aug 2019 07:43:39 +0000
Subject: [PATCH][iio-next] iio: light: noa1305: fix missing break in a switch statement
Message-Id: <20190815074339.32380-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Martyn Welch <martyn.welch@collabora.com>, Sergei M <fizik1@yandex.com>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a missing break for the NOA1305_INTEGR_TIME_400MS case,
fix it by adding it in.

Addresses-Coverity: ("Missing break in switch")
Fixes: 741172d18e8a ("iio: light: noa1305: Add support for NOA1305")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/light/noa1305.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/noa1305.c b/drivers/iio/light/noa1305.c
index 7b859ae1044d..5ebfbc52f541 100644
--- a/drivers/iio/light/noa1305.c
+++ b/drivers/iio/light/noa1305.c
@@ -85,6 +85,7 @@ static int noa1305_scale(struct noa1305_priv *priv, int *val, int *val2)
 	case NOA1305_INTEGR_TIME_400MS:
 		*val = 100;
 		*val2 = 77 * 4;
+		break;
 	case NOA1305_INTEGR_TIME_200MS:
 		*val = 100;
 		*val2 = 77 * 2;
-- 
2.20.1
