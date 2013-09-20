From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Sep 2013 11:37:36 +0000
Subject: [patch] perf: potential underflow in perf_sample_ustack_size()
Message-Id: <20130920113736.GB8655@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>, Jiri Olsa <jolsa@redhat.com>
Cc: Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The code here is trying to ensure that we don't have a
"header_size + stack_size" which is more than USHRT_MAX.  I changed
the overflow check a little to make it more clear.

My concern here is that if "header_size + sizeof(u64)" is very large
then we could end up with underflow doing the subtraction and end up
with a "stack_size" larger than intended.

I don't know perf well enough to say if this is possible.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/events/core.c b/kernel/events/core.c
index dd236b6..eec9e683 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4217,11 +4217,13 @@ perf_sample_ustack_size(u16 stack_size, u16 header_size,
 	header_size += 2 * sizeof(u64);
 
 	/* Do we fit in with the current stack dump size? */
-	if ((u16) (header_size + stack_size) < header_size) {
+	if (header_size > USHRT_MAX - stack_size) {
 		/*
 		 * If we overflow the maximum size for the sample,
 		 * we customize the stack dump size to fit in.
 		 */
+		if (header_size + sizeof(u64) > USHRT_MAX)
+			return 0;
 		stack_size = USHRT_MAX - header_size - sizeof(u64);
 		stack_size = round_up(stack_size, sizeof(u64));
 	}
