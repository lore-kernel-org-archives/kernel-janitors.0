From: Nicolas Kaiser <nikai@nikai.net>
Date: Fri, 09 Nov 2007 13:08:32 +0000
Subject: [PATCH] drivers/misc/sony-laptop.c: remove duplicated define
Message-Id: <20071109140832.4f2a145c@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated define.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---

 drivers/misc/sony-laptop.c |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/misc/sony-laptop.c	2007-11-07 11:26:12.000000000 +0100
+++ b/drivers/misc/sony-laptop.c	2007-11-09 13:56:36.000000000 +0100
@@ -1504,7 +1504,6 @@
 #define SONYPI_CAMERA_SHUTTER_MASK 		0x7
 
 #define SONYPI_CAMERA_SHUTDOWN_REQUEST		7
-#define SONYPI_CAMERA_CONTROL			0x10
 
 #define SONYPI_CAMERA_STATUS 			7
 #define SONYPI_CAMERA_STATUS_READY 		0x2
