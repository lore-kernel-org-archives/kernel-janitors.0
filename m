From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Apr 2019 08:15:29 +0000
Subject: [PATCH] Documentation: bus: ti-sysc: fix spelling mistake "multipe" -> "multiple"
Message-Id: <20190404081529.15394-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, Faiz Abbas <faiz_abbas@ti.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Documentation. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/devicetree/bindings/bus/ti-sysc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
index 85a23f551f02..8eec4c384000 100644
--- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
+++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
@@ -131,6 +131,6 @@ using offsets from l4_cfg second segment (0x4a000000 + 0x80000 = 0x4a0ab000):
 		};
 	};
 
-Note that other SoCs, such as am335x can have multipe child devices. On am335x
+Note that other SoCs, such as am335x can have multiple child devices. On am335x
 there are two MUSB instances, two USB PHY instances, and a single CPPI41 DMA
 instance as children of a single interconnet target module.
-- 
2.20.1
