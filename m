From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Oct 2011 11:42:41 +0000
Subject: [patch] drm/i915: fix if statement (bogus semi-colon)
Message-Id: <20111028114241.GA13603@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The semi-colon is a typo here and it makes the if statement
unconditional.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/agp/intel-gtt.c b/drivers/char/agp/intel-gtt.c
index 66cd0b8..3a8d448 100644
--- a/drivers/char/agp/intel-gtt.c
+++ b/drivers/char/agp/intel-gtt.c
@@ -1236,7 +1236,7 @@ static int i9xx_setup(void)
 		intel_private.gtt_bus_addr = reg_addr + gtt_offset;
 	}
 
-	if (needs_idle_maps());
+	if (needs_idle_maps())
 		intel_private.base.do_idle_maps = 1;
 
 	intel_i9xx_setup_flush();
