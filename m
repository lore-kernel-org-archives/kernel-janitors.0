From: Chris Peterson <cpeterso@cpeterso.com>
Date: Thu, 15 Sep 2011 06:39:19 +0000
Subject: [PATCH] drivers/staging/comedi/drivers/ni_stc.h: rename prototype parameter from 'register' to 'reg'
Message-Id: <1316068759-3460-1-git-send-email-cpeterso@cpeterso.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

gcc -Wextra warns "‘register’ is not at beginning of declaration" because the
compiler thinks the parameter has been marked as a 'register' variable, but
the function prototype intended to name the parameter "register" (which is a
reserved keyword).

Signed-off-by: Chris Peterson <cpeterso@cpeterso.com>
---
 drivers/staging/comedi/drivers/ni_stc.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_stc.h b/drivers/staging/comedi/drivers/ni_stc.h
index 504ea71..7f09388 100644
--- a/drivers/staging/comedi/drivers/ni_stc.h
+++ b/drivers/staging/comedi/drivers/ni_stc.h
@@ -1429,10 +1429,10 @@ struct ni_board_struct {
 #define NUM_GPCT 2
 
 #define NI_PRIVATE_COMMON					\
-	uint16_t (*stc_readw)(struct comedi_device *dev, int register);	\
-	uint32_t (*stc_readl)(struct comedi_device *dev, int register);	\
-	void (*stc_writew)(struct comedi_device *dev, uint16_t value, int register);	\
-	void (*stc_writel)(struct comedi_device *dev, uint32_t value, int register);	\
+	uint16_t (*stc_readw)(struct comedi_device *dev, int reg);	\
+	uint32_t (*stc_readl)(struct comedi_device *dev, int reg);	\
+	void (*stc_writew)(struct comedi_device *dev, uint16_t value, int reg);	\
+	void (*stc_writel)(struct comedi_device *dev, uint32_t value, int reg);	\
 	\
 	unsigned short dio_output;				\
 	unsigned short dio_control;				\
-- 
1.7.4.1

