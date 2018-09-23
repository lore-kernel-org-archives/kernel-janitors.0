From: YueHaibing <yuehaibing@huawei.com>
Date: Sun, 23 Sep 2018 12:11:33 +0000
Subject: [PATCH -next] ring-buffer: Fix ring buffer size in rb_write_something
Message-Id: <1537704693-184237-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

'cnt' should be used to calculate ring buffer size rather than data->cnt

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 kernel/trace/ring_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 65bd461..53538c3 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4924,7 +4924,7 @@ static __init int rb_write_something(struct rb_test_data *data, bool nested)
 	cnt = data->cnt + (nested ? 27 : 0);
 
 	/* Multiply cnt by ~e, to make some unique increment */
-	size = (data->cnt * 68 / 25) % (sizeof(rb_string) - 1);
+	size = (cnt * 68 / 25) % (sizeof(rb_string) - 1);
 
 	len = size + sizeof(struct rb_item);
 
