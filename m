From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Jan 2020 10:04:27 +0000
Subject: [PATCH] devices.txt: fix spelling mistake: "shapshot" -> "snapshot"
Message-Id: <20200110100427.236530-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix spelling mistake in text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/admin-guide/devices.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 1c5d2281efc9..2a97aaec8b12 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -319,7 +319,7 @@
 		182 = /dev/perfctr	Performance-monitoring counters
 		183 = /dev/hwrng	Generic random number generator
 		184 = /dev/cpu/microcode CPU microcode update interface
-		186 = /dev/atomicps	Atomic shapshot of process state data
+		186 = /dev/atomicps	Atomic snapshot of process state data
 		187 = /dev/irnet	IrNET device
 		188 = /dev/smbusbios	SMBus BIOS
 		189 = /dev/ussp_ctl	User space serial port control
-- 
2.24.0
