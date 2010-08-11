From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 11 Aug 2010 08:00:48 +0000
Subject: [PATCH] staging: adis16255: fix sysfs leak
Message-Id: <1281513650-5346-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Matthias Brugger <mensch0815@gmail.com>, Mike Frysinger <vapier@gentoo.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Original code does not call sysfs_remove_group() on error. This can lead
to NULL dereference.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/adis16255/adis16255.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/adis16255/adis16255.c b/drivers/staging/adis16255/adis16255.c
index c3e6a4d..8d4d7cb 100644
--- a/drivers/staging/adis16255/adis16255.c
+++ b/drivers/staging/adis16255/adis16255.c
@@ -406,12 +406,14 @@ static int __devinit spi_adis16255_probe(struct spi_device *spi)
 
 	status = spi_adis16255_bringup(spiadis);
 	if (status != 0)
-		goto irq_err;
+		goto sysfs_err;
 
 	dev_info(&spi->dev, "spi_adis16255 driver added!\n");
 
 	return status;
 
+sysfs_err:
+	sysfs_remove_group(&spiadis->spi->dev.kobj, &adis16255_attr_group);
 irq_err:
 	free_irq(spiadis->irq, spiadis);
 gpio_err:
-- 
1.7.0.4

