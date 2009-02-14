From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:15:49 +0000
Subject: [PATCH 15/43] drivers/net/bonding: fix sparse warning: symbol shadows
Message-Id: <20090214211541.23489.33717.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Rename function scope variable.

Fix this sparse warning:
  drivers/net/bonding/bond_main.c:4704:13: warning: symbol 'mode' shadows an earlier one
  drivers/net/bonding/bond_main.c:95:13: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/bonding/bond_main.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 45f6d6a..c5abd17 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -4701,7 +4701,7 @@ static void bond_free_all(void)
  */
 int bond_parse_parm(const char *buf, const struct bond_parm_tbl *tbl)
 {
-	int mode = -1, i, rv;
+	int modeint = -1, i, rv;
 	char *p, modestr[BOND_MAX_MODENAME_LEN + 1] = { 0, };
 
 	for (p = (char *)buf; *p; p++)
@@ -4711,13 +4711,13 @@ int bond_parse_parm(const char *buf, const struct bond_parm_tbl *tbl)
 	if (*p)
 		rv = sscanf(buf, "%20s", modestr);
 	else
-		rv = sscanf(buf, "%d", &mode);
+		rv = sscanf(buf, "%d", &modeint);
 
 	if (!rv)
 		return -1;
 
 	for (i = 0; tbl[i].modename; i++) {
-		if (mode = tbl[i].mode)
+		if (modeint = tbl[i].mode)
 			return tbl[i].mode;
 		if (strcmp(modestr, tbl[i].modename) = 0)
 			return tbl[i].mode;

