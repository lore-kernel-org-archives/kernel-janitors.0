From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 10:15:02 +0000
Subject: [PATCH] char/ipmi: fix spelling mistake "receieved_messages" -> "received_messages"
Message-Id: <20190418101502.9748-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aishwarya Pant <aishpant@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/ABI/testing/sysfs-devices-platform-ipmi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-ipmi b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
index 2a781e7513b7..afb5db856e1c 100644
--- a/Documentation/ABI/testing/sysfs-devices-platform-ipmi
+++ b/Documentation/ABI/testing/sysfs-devices-platform-ipmi
@@ -212,7 +212,7 @@ Description:
 					Messages may be broken into parts if
 					they are long.
 
-		receieved_messages:	(RO) Number of message responses
+		received_messages:	(RO) Number of message responses
 					received.
 
 		received_message_parts: (RO) Number of message fragments
-- 
2.20.1
