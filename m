From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 18 Aug 2012 16:12:49 +0000
Subject: [PATCH 2/2] tty: serial: Remove explicit use of devm_kfree
Message-Id: <1345306369-10407-2-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345306369-10407-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1345306369-10407-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

There is no reason to explicitly call devm_kfree
in probe or remove functions.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/tty/serial/max310x.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index 06ff5ad..2bc28a5 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1198,7 +1198,6 @@ err_freq:
 
 err_out:
 	dev_set_drvdata(dev, NULL);
-	devm_kfree(dev, s);
 
 	return ret;
 }
@@ -1234,8 +1233,6 @@ static int __devexit max310x_remove(struct spi_device *spi)
 	if (s->pdata->exit)
 		s->pdata->exit();
 
-	devm_kfree(dev, s);
-
 	return ret;
 }
 
-- 
1.7.10.4

