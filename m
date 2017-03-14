From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:55:01 +0000
Subject: [PATCH] staging: atomisp: silence an array overflow warning
Message-Id: <20170314075501.GB6022@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that we should check if "i" is in bounds
before we check if "var8[i]" is a NUL char.  This bug is harmless but
also easy to fix.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
index 65513cae93ce..1dd061f00cd9 100644
--- a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
@@ -669,7 +669,7 @@ int gmin_get_config_var(struct device *dev, const char *var, char *out, size_t *
 	/* Our variable names are ASCII by construction, but EFI names
 	 * are wide chars.  Convert and zero-pad. */
 	memset(var16, 0, sizeof(var16));
-	for (i=0; var8[i] && i < sizeof(var8); i++)
+	for (i = 0; i < sizeof(var8) && var8[i]; i++)
 		var16[i] = var8[i];
 
 	/* To avoid owerflows when calling the efivar API */
