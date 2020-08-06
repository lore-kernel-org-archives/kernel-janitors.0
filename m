From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 10:29:01 +0000
Subject: [PATCH][V2] macintosh: windfarm: remove detatch debug containing spelling mistakes
Message-Id: <20200806102901.44988-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Wolfram Sang <wsa@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in two debug messages. As recommended
by Wolfram Sang, these can be removed as there is plenty of debug
in the driver core.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: remove the debug rather than fixing the spelling

---
 drivers/macintosh/windfarm_lm75_sensor.c | 2 --
 drivers/macintosh/windfarm_lm87_sensor.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 1e5fa09845e7..29f48c2028b6 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -152,8 +152,6 @@ static int wf_lm75_remove(struct i2c_client *client)
 {
 	struct wf_lm75_sensor *lm = i2c_get_clientdata(client);
 
-	DBG("wf_lm75: i2c detatch called for %s\n", lm->sens.name);
-
 	/* Mark client detached */
 	lm->i2c = NULL;
 
diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index d011899c0a8a..9fab0b47cd3d 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -149,8 +149,6 @@ static int wf_lm87_remove(struct i2c_client *client)
 {
 	struct wf_lm87_sensor *lm = i2c_get_clientdata(client);
 
-	DBG("wf_lm87: i2c detatch called for %s\n", lm->sens.name);
-
 	/* Mark client detached */
 	lm->i2c = NULL;
 
-- 
2.27.0
