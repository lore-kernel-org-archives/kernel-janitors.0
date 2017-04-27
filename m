From: Shekhar Bhandakkar <cs14btech11006@iith.ac.in>
Date: Thu, 27 Apr 2017 16:52:32 +0000
Subject: [PATCH] staging: speakup: Replace simple_strtoul by kstrtoul
Message-Id: <20170427164032.GA1578@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The simple_strtoul function is obsolete.
This patch replaces it by kstrtoul.

Signed-off-by: Shekhar Bhandakkar <cs14btech11006@iith.ac.in>
---
 drivers/staging/speakup/kobjects.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/speakup/kobjects.c b/drivers/staging/speakup/kobjects.c
index ca85476..8b9ddb9 100644
--- a/drivers/staging/speakup/kobjects.c
+++ b/drivers/staging/speakup/kobjects.c
@@ -127,6 +127,7 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
 	int do_characters = !strcmp(attr->attr.name, "characters");
 	size_t desc_length = 0;
 	int i;
+	int err;
 
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	while (cp < end) {
@@ -153,7 +154,9 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
 			continue;
 		}
 
-		index = simple_strtoul(cp, &temp, 10);
+		err = kstrtoul(cp, 10, &index);
+		if (err)
+			return err;
 		if (index > 255) {
 			rejected++;
 			cp = linefeed + 1;
-- 
2.7.4

