From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:50:06 +0000
Subject: [PATCH 41/43] drivers/net/wireless/b43: fix warning: format not a
Message-Id: <20090214214956.24377.19315.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this compilation warning:
  drivers/net/wireless/b43/main.c: In function 'b43_print_fw_helptext':
  drivers/net/wireless/b43/main.c:1971: warning: format not a string literal and no format arguments
  drivers/net/wireless/b43/main.c:1973: warning: format not a string literal and no format arguments

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wireless/b43/main.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/b43/main.c b/drivers/net/wireless/b43/main.c
index dbb8765..7116ab6 100644
--- a/drivers/net/wireless/b43/main.c
+++ b/drivers/net/wireless/b43/main.c
@@ -1961,12 +1961,12 @@ static void b43_release_firmware(struct b43_wldev *dev)
 
 static void b43_print_fw_helptext(struct b43_wl *wl, bool error)
 {
-	const char *text;
+	const char text[] +		"You must go to " \
+		"http://wireless.kernel.org/en/users/Drivers/b43#devicefirmware " \
+		"and download the correct firmware for this driver version. " \
+		"Please carefully read all instructions on this website.\n";
 
-	text = "You must go to "
-	       "http://wireless.kernel.org/en/users/Drivers/b43#devicefirmware "
-	       "and download the correct firmware for this driver version. "
-	       "Please carefully read all instructions on this website.\n";
 	if (error)
 		b43err(wl, text);
 	else

