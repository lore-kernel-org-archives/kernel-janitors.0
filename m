From: Radu Voicilas <rvoicilas@gmail.com>
Date: Sat, 12 Dec 2009 09:06:12 +0000
Subject: [PATCH 4/4] Spelling fixes.
Message-Id: <1260608772-9839-5-git-send-email-rvoicilas@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

No change in functionality.

Signed-off-by: Radu Voicilas <rvoicilas@gmail.com>
---
 samples/kprobes/kretprobe_example.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
index 1041b67..7aca41a 100644
--- a/samples/kprobes/kretprobe_example.c
+++ b/samples/kprobes/kretprobe_example.c
@@ -35,7 +35,7 @@ struct my_data {
 	ktime_t entry_stamp;
 };
 
-/* Here we use the entry_hanlder to timestamp function entry */
+/* Here we use the entry_handler to timestamp function entry */
 static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
 {
 	struct my_data *data;
-- 
1.6.3.3

