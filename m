From: Chris Peterson <cpeterso@cpeterso.com>
Date: Thu, 15 Sep 2011 06:36:13 +0000
Subject: [PATCH] drivers/isdn/hardware/eicon/platform.h: rename prototype parameter from 'register' to 'reg'
Message-Id: <1316068573-3337-1-git-send-email-cpeterso@cpeterso.com>
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
 drivers/isdn/hardware/eicon/platform.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/eicon/platform.h b/drivers/isdn/hardware/eicon/platform.h
index 15d4942..c36fffe 100644
--- a/drivers/isdn/hardware/eicon/platform.h
+++ b/drivers/isdn/hardware/eicon/platform.h
@@ -206,7 +206,7 @@ void PCIread (byte bus, byte func, int offset, void* data, int length, void* pci
 /*
 **  I/O Port utilities
 */
-int diva_os_register_io_port (void *adapter, int register, unsigned long port,
+int diva_os_register_io_port (void *adapter, int on, unsigned long port,
 				unsigned long length, const char* name, int id);
 /*
 **  I/O port access abstraction
-- 
1.7.4.1

