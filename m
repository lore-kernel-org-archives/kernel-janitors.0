From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Mar 2016 07:51:51 +0000
Subject: [patch] drm/amdkfd: uninitialized variable in dbgdev_wave_control_set_registers()
Message-Id: <20160311075151.GA7902@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay@gmail.com>, Yair Shachar <yair.shachar@amd.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At the end of the function we expect "status" to be zero, but it's
either -EINVAL or unitialized.

Fixes: 788bf83db301 ('drm/amdkfd: Add wave control operation to debugger')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
index c34c393..d5e19b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c
@@ -513,7 +513,7 @@ static int dbgdev_wave_control_set_registers(
 				union SQ_CMD_BITS *in_reg_sq_cmd,
 				union GRBM_GFX_INDEX_BITS *in_reg_gfx_index)
 {
-	int status;
+	int status = 0;
 	union SQ_CMD_BITS reg_sq_cmd;
 	union GRBM_GFX_INDEX_BITS reg_gfx_index;
 	struct HsaDbgWaveMsgAMDGen2 *pMsg;
