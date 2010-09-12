From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:57:24 +0000
Subject: [PATCH] gpio: sx150x: fix error code value
Message-Id: <1284317845-5181-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Gregory Bean <gbean@codeaurora.org>, linux-kernel@vger.kernel.org

The return code of sx150x_get_io() is propagated as error code,
so it should look like standard code.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/gpio/sx150x.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/sx150x.c b/drivers/gpio/sx150x.c
index b42f42c..b0eed89 100644
--- a/drivers/gpio/sx150x.c
+++ b/drivers/gpio/sx150x.c
@@ -179,7 +179,7 @@ static int sx150x_get_io(struct sx150x_chip *chip, unsigned offset)
 	sx150x_find_cfg(offset, 1, &reg, &mask, &shift);
 	err = sx150x_i2c_read(chip->client, reg, &data);
 	if (err >= 0)
-		err = (data & mask) != 0 ? 1 : 0;
+		err = (data & mask) != 0 ? -EIO : 0;
 
 	return err;
 }
-- 
1.7.0.4

