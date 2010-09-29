From: Dan Carpenter <error27@gmail.com>
Date: Wed, 29 Sep 2010 08:41:05 +0000
Subject: [patch v2] tlb_uv: use allocated buffer in tunables_read()
Message-Id: <20100929083118.GA6376@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100816105502.GC645@bicker> <20100927161203.732833b0.akpm@linux-foundation.org>
In-Reply-To: <20100927161203.732833b0.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Cliff Wickman <cpw@sgi.com>, Jack Steiner <steiner@sgi.com>, Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code didn't check that the value returned from snprintf()
was less than the size of the buffer.  Although it didn't cause a
runtime bug in this case, it makes the static checkers complain.

Andrew Morton suggested a dynamically sized buffer would be cleaner.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't have an x86_64 system so I haven't been able to compile this
code.  Sorry for that.

V2:  The first version was yuk.

diff --git a/arch/x86/kernel/tlb_uv.c b/arch/x86/kernel/tlb_uv.c
index 312ef02..33e77e4 100644
--- a/arch/x86/kernel/tlb_uv.c
+++ b/arch/x86/kernel/tlb_uv.c
@@ -1001,10 +1001,10 @@ static int uv_ptc_seq_show(struct seq_file *file, void *data)
 static ssize_t tunables_read(struct file *file, char __user *userbuf,
 						size_t count, loff_t *ppos)
 {
-	char buf[300];
+	char *buf;
 	int ret;
 
-	ret = snprintf(buf, 300, "%s %s %s\n%d %d %d %d %d %d %d %d %d\n",
+	buf = kasprintf(GFP_KERNEL, "%s %s %s\n%d %d %d %d %d %d %d %d %d\n",
 		"max_bau_concurrent plugged_delay plugsb4reset",
 		"timeoutsb4reset ipi_reset_limit complete_threshold",
 		"congested_response_us congested_reps congested_period",
@@ -1012,7 +1012,12 @@ static ssize_t tunables_read(struct file *file, char __user *userbuf,
 		timeoutsb4reset, ipi_reset_limit, complete_threshold,
 		congested_response_us, congested_reps, congested_period);
 
-	return simple_read_from_buffer(userbuf, count, ppos, buf, ret);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
+	kfree(buf);
+	return ret;
 }
 
 /*
