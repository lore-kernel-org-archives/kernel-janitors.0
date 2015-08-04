From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Aug 2015 07:47:23 +0000
Subject: [patch] extcon: signedness bugs break error handling
Message-Id: <20150804074723.GC10867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Roger Quadros <rogerq@ti.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Unsigned is never less than zero so this error handling won't work.

Fixes: be052cc87745 ('extcon: Fix hang and extcon_get/set_cable_state().')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 8301a72..da2fb6c 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -143,7 +143,7 @@ static int find_cable_id_by_name(struct extcon_dev *edev, const char *name)
 
 static int find_cable_index_by_name(struct extcon_dev *edev, const char *name)
 {
-	unsigned int id;
+	int id;
 
 	if (edev->max_supported = 0)
 		return -EINVAL;
@@ -379,7 +379,7 @@ EXPORT_SYMBOL_GPL(extcon_get_cable_state_);
  */
 int extcon_get_cable_state(struct extcon_dev *edev, const char *cable_name)
 {
-	unsigned int id;
+	int id;
 
 	id = find_cable_id_by_name(edev, cable_name);
 	if (id < 0)
@@ -430,7 +430,7 @@ EXPORT_SYMBOL_GPL(extcon_set_cable_state_);
 int extcon_set_cable_state(struct extcon_dev *edev,
 			const char *cable_name, bool cable_state)
 {
-	unsigned int id;
+	int id;
 
 	id = find_cable_id_by_name(edev, cable_name);
 	if (id < 0)
