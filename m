From: Chris Peterson <cpeterso@cpeterso.com>
Date: Thu, 15 Sep 2011 06:43:43 +0000
Subject: [PATCH] drivers/net/wireless/airo.c: rename prototype parameter from 'register' to 'reg'
Message-Id: <1316069023-3524-1-git-send-email-cpeterso@cpeterso.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

gcc -Wextra warns "‘register’ is not at beginning of declaration" because the
compiler thinks the parameter has been marked as a 'register' variable, but
the function prototype intended to name the parameter "register" (which is a
reserved keyword).

Signed-off-by: Chris Peterson <cpeterso@cpeterso.com>
---
 drivers/net/wireless/airo.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index e1b3e3c..ba266c1 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -1102,8 +1102,8 @@ static const char version[] = "airo.c 0.6 (Ben Reed & Javier Achirica)";
 struct airo_info;
 
 static int get_dec_u16( char *buffer, int *start, int limit );
-static void OUT4500( struct airo_info *, u16 register, u16 value );
-static unsigned short IN4500( struct airo_info *, u16 register );
+static void OUT4500(struct airo_info *, u16 reg, u16 value);
+static unsigned short IN4500(struct airo_info *, u16 reg);
 static u16 setup_card(struct airo_info*, u8 *mac, int lock);
 static int enable_MAC(struct airo_info *ai, int lock);
 static void disable_MAC(struct airo_info *ai, int lock);
-- 
1.7.4.1

