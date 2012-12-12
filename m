From: Cyril Roelandt <tipecaml@gmail.com>
Date: Wed, 12 Dec 2012 00:24:50 +0000
Subject: [PATCH 1/5] staging: omap-thermal: fix error check in omap_thermal_expose_sensor() and in omap_therm
Message-Id: <1355271894-5284-2-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>, gregkh@linuxfoundation.org, eduardo.valentin@ti.com, rui.zhang@intel.com, durgadoss.r@intel.com, rjw@sisk.pl, devel@driverdev.osuosl.org


The omap_bandgap_get_sensor_data() function returns ERR_PTR(), so we need to use
IS_ERR() rather than a NULL check.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/omap-thermal/omap-thermal-common.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/omap-thermal/omap-thermal-common.c b/drivers/staging/omap-thermal/omap-thermal-common.c
index 61f1070..79a55aa 100644
--- a/drivers/staging/omap-thermal/omap-thermal-common.c
+++ b/drivers/staging/omap-thermal/omap-thermal-common.c
@@ -260,7 +260,7 @@ int omap_thermal_expose_sensor(struct omap_bandgap *bg_ptr, int id,
 
 	data = omap_bandgap_get_sensor_data(bg_ptr, id);
 
-	if (!data)
+	if (IS_ERR(data))
 		data = omap_thermal_build_data(bg_ptr, id);
 
 	if (!data)
@@ -309,7 +309,7 @@ int omap_thermal_register_cpu_cooling(struct omap_bandgap *bg_ptr, int id)
 	struct omap_thermal_data *data;
 
 	data = omap_bandgap_get_sensor_data(bg_ptr, id);
-	if (!data)
+	if (IS_ERR(data))
 		data = omap_thermal_build_data(bg_ptr, id);
 
 	if (!data)
-- 
1.7.10.4

