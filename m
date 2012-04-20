From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 06:31:45 +0000
Subject: [patch] tracing: Remove an unneeded check
Message-Id: <20120420063145.GA22649@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

memcpy() returns a pointer to "bug".  Hopefully, it's not NULL here or
we would already have Oopsed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index ed7b5d1..c2d5b71 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -629,7 +629,6 @@ ssize_t trace_seq_to_user(struct trace_seq *s, char __user *ubuf, size_t cnt)
 static ssize_t trace_seq_to_buffer(struct trace_seq *s, void *buf, size_t cnt)
 {
 	int len;
-	void *ret;
 
 	if (s->len <= s->readpos)
 		return -EBUSY;
@@ -637,9 +636,7 @@ static ssize_t trace_seq_to_buffer(struct trace_seq *s, void *buf, size_t cnt)
 	len = s->len - s->readpos;
 	if (cnt > len)
 		cnt = len;
-	ret = memcpy(buf, s->buffer + s->readpos, cnt);
-	if (!ret)
-		return -EFAULT;
+	memcpy(buf, s->buffer + s->readpos, cnt);
 
 	s->readpos += cnt;
 	return cnt;
