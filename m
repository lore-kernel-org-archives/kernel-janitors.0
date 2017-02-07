From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:20:53 +0000
Subject: [patch] mac80211: check for allocation failure in debugfs code
Message-Id: <20170207132052.GE27416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

kmalloc() can fail.  Also let's move the allocation out of the
declaration block so it's easier to read.

Fixes: 4a5eccaa9350 ("mac80211: Show pending txqlen in debugfs.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
index f62cd0e13c58..4689353aa263 100644
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -249,12 +249,19 @@ static ssize_t misc_read(struct file *file, char __user *user_buf,
 	struct ieee80211_local *local = file->private_data;
 	/* Max len of each line is 16 characters, plus 9 for 'pending:\n' */
 	size_t bufsz = IEEE80211_MAX_QUEUES * 16 + 9;
-	char *buf = kzalloc(bufsz, GFP_KERNEL);
-	char *pos = buf, *end = buf + bufsz - 1;
+	char *buf;
+	char *pos, *end;
 	ssize_t rv;
 	int i;
 	int ln;
 
+	buf = kzalloc(bufsz, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	pos = buf;
+	end = buf + bufsz - 1;
+
 	pos += scnprintf(pos, end - pos, "pending:\n");
 
 	for (i = 0; i < IEEE80211_MAX_QUEUES; i++) {
