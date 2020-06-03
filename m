From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 14:04:31 +0000
Subject: [PATCH] input: elantech: remove redundant assignments to variable error
Message-Id: <20200603140431.131347-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/elantech.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..e4f394cc0520 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1897,7 +1897,7 @@ static bool elantech_use_host_notify(struct psmouse *psmouse,
 int elantech_init_smbus(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-	int error = -EINVAL;
+	int error;
 
 	psmouse_reset(psmouse);
 
@@ -2015,7 +2015,7 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
 int elantech_init_ps2(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-	int error = -EINVAL;
+	int error;
 
 	psmouse_reset(psmouse);
 
@@ -2036,7 +2036,7 @@ int elantech_init_ps2(struct psmouse *psmouse)
 int elantech_init(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-	int error = -EINVAL;
+	int error;
 
 	psmouse_reset(psmouse);
 
-- 
2.25.1
