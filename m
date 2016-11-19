From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Sat, 19 Nov 2016 18:22:41 +0000
Subject: [PATCH] stm class: Add a missing call to put_device
Message-Id: <20161119182241.9030-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Quentin Lambert <lambert.quentin@gmail.com>

Most error branches following the call to class_find_device contain
a call to put_device. This patch add calls to put_device where
they are missing.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

---
 drivers/hwtracing/stm/core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -368,8 +368,10 @@ static int stm_char_open(struct inode *i
 		return -ENODEV;
 
 	stmf = kzalloc(sizeof(*stmf), GFP_KERNEL);
-	if (!stmf)
+	if (!stmf) {
+		put_device(dev);
 		return -ENOMEM;
+	}
 
 	stm_output_init(&stmf->output);
 	stmf->stm = to_stm_device(dev);
