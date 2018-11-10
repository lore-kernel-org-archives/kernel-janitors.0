From: Colin King <colin.king@canonical.com>
Date: Sat, 10 Nov 2018 23:28:06 +0000
Subject: [PATCH] staging: mt7621-pinctrl: fix uninitialized variable ngroups
Message-Id: <20181110232806.14255-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, John Crispin <blogic@openwrt.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the for_each_node_with_property loop us incrementing variable
ngroups however it was not initialized and hence will contain garbage.
Fix this by initializing ngroups to zero.

Detected with static analysis with cppcheck:

drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c:89]: (error) Uninitialized
variable: ngroups

Fixes: e12a1a6e087b ("staging: mt7621-pinctrl: refactor rt2880_pinctrl_dt_node_to_map function")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
index b8566ed898f1..aa98fbb17013 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
@@ -82,7 +82,7 @@ static int rt2880_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrldev,
 	struct property *prop;
 	const char *function_name, *group_name;
 	int ret;
-	int ngroups;
+	int ngroups = 0;
 	unsigned int reserved_maps = 0;
 
 	for_each_node_with_property(np_config, "group")
-- 
2.19.1
