From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Apr 2016 14:50:32 +0000
Subject: [patch] memory: of_memory: Silence uninitialized variable warning
Message-Id: <20160415145032.GG8953@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Aneesh V <aneesh@ti.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Presumably we never use the default: case statement which prints a
warning message.  But my static checker complains that if we do, we will
hit an uninitialized variable warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index 6007435..9daf94b 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -109,7 +109,7 @@ const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
 	struct lpddr2_timings	*timings = NULL;
 	u32			arr_sz = 0, i = 0;
 	struct device_node	*np_tim;
-	char			*tim_compat;
+	char			*tim_compat = NULL;
 
 	switch (device_type) {
 	case DDR_TYPE_LPDDR2_S2:
