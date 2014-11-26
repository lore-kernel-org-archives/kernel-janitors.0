From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Nov 2014 14:06:21 +0000
Subject: [patch] tracing: off by one in __trace_array_vprintk()
Message-Id: <20141126140621.GA18740@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This check says "goto out;" if we had to truncate the string.

The "tbuffer" buffer has TRACE_BUF_SIZE bytes.  The vsnprintf() function
returns the number of characters (not counting the NUL char) which would
have been printed if there were space.  If we we tried to print
TRACE_BUF_SIZE characters, the last character would have been truncated
to make space for the NUL character so we should "goto out;".

My other concern here was that a few lines later we do:

	entry->buf[len] = '\0';

I worried that maybe we were putting the NUL char past the end of the
array but I wasn't smart enough to figure out the size of entry->buf[].

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 42a822d..22af2ae 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2161,7 +2161,7 @@ __trace_array_vprintk(struct ring_buffer *buffer,
 	}
 
 	len = vsnprintf(tbuffer, TRACE_BUF_SIZE, fmt, args);
-	if (len > TRACE_BUF_SIZE)
+	if (len >= TRACE_BUF_SIZE)
 		goto out;
 
 	local_save_flags(flags);
