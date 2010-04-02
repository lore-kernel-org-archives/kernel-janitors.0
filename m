From: Dan Carpenter <error27@gmail.com>
Date: Fri, 02 Apr 2010 11:28:43 +0000
Subject: [patch] dma-debug: off by one issue
Message-Id: <20100402112843.GI5265@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: Ingo Molnar <mingo@elte.hu>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Shaun Ruffell <sruffell@digium.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to reserve the last character for the NULL terminator.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/lib/dma-debug.c b/lib/dma-debug.c
index ba8b670..01e6427 100644
--- a/lib/dma-debug.c
+++ b/lib/dma-debug.c
@@ -570,7 +570,7 @@ static ssize_t filter_write(struct file *file, const char __user *userbuf,
 	 * Now parse out the first token and use it as the name for the
 	 * driver to filter for.
 	 */
-	for (i = 0; i < NAME_MAX_LEN; ++i) {
+	for (i = 0; i < NAME_MAX_LEN - 1; ++i) {
 		current_driver_name[i] = buf[i];
 		if (isspace(buf[i]) || buf[i] = ' ' || buf[i] = 0)
 			break;
