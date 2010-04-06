From: Dan Carpenter <error27@gmail.com>
Date: Tue, 06 Apr 2010 16:45:12 +0000
Subject: [patch v2] dma-debug: cleanup for loop
Message-Id: <20100406164512.GF21229@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100402112843.GI5265@bicker> <20100403204717.GS24846@8bytes.org> <20100405125329.GA16197@bicker> <20100405140215.GA29758@8bytes.org> <20100405140909.GB29758@8bytes.org>
In-Reply-To: <20100405140909.GB29758@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Ingo Molnar <mingo@elte.hu>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Shaun Ruffell <sruffell@digium.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Earlier in this function we set the last byte of "buf" to NULL so we 
always hit the break statement and "i" is never equal to NAME_MAX_LEN.  
This patch doesn't change how the driver works but it silences a Smatch 
warning and it makes it clearer that we don't write past the end of the 
array.

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
