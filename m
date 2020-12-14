From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Dec 2020 08:45:03 +0000
Subject: [PATCH] trace: drop unneeded assignment in ring_buffer_resize()
Message-Id: <20201214084503.3079-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Qiujun Huang <hqjagain@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Since commit 0a1754b2a97e ("ring-buffer: Return 0 on success from
ring_buffer_resize()"), computing the size is not needed anymore.

Drop unneeded assignment in ring_buffer_resize().

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 kernel/trace/ring_buffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 91db9d032a0c..95ecfb107e3e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1974,8 +1974,6 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
 	if (nr_pages < 2)
 		nr_pages = 2;
 
-	size = nr_pages * BUF_PAGE_SIZE;
-
 	/* prevent another thread from changing buffer sizes */
 	mutex_lock(&buffer->mutex);
 
-- 
2.17.1
