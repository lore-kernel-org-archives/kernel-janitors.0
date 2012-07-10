From: Kay Sievers <kay@vrfy.org>
Date: Tue, 10 Jul 2012 21:24:51 +0000
Subject: Re: [driver-core:driver-core-linus 6/6] 'syslog_partial' defined but not used on !CONFIG_PRINTK
Message-Id: <1341955491.810.3.camel@mop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120710001509.GD5584@localhost>
In-Reply-To: <20120710001509.GD5584@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-07-10 at 08:15 +0800, wfg@linux.intel.com wrote:
> There are new compile warnings show up in
> 
> vim +220 kernel/printk.c
>    217	/* the next printk record to read by syslog(READ) or /proc/kmsg */
>    218	static u64 syslog_seq;
>    219	static u32 syslog_idx;
>  > 220	static size_t syslog_partial;

Oh, that again, sorry. :)

I moved all variables out of the weird ifdef mess now, that should make it
a bit easier to avoid forgetting that.

Thanks,
Kay


From: Kay Sievers <kay@vrfy.org>
Subject: kmsg - avoid warning for CONFIG_PRINTK=n compilations

Signed-off-by: Kay Sievers <kay@vrfy.org>
---

 kernel/printk.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -216,6 +216,7 @@ struct log {
  */
 static DEFINE_RAW_SPINLOCK(logbuf_lock);
 
+#ifdef CONFIG_PRINTK
 /* the next printk record to read by syslog(READ) or /proc/kmsg */
 static u64 syslog_seq;
 static u32 syslog_idx;
@@ -228,7 +229,6 @@ static u32 log_first_idx;
 
 /* index and sequence number of the next record to store in the buffer */
 static u64 log_next_seq;
-#ifdef CONFIG_PRINTK
 static u32 log_next_idx;
 
 /* the next printk record to read after the last 'clear' command */
@@ -1631,9 +1631,15 @@ asmlinkage int printk(const char *fmt, .
 }
 EXPORT_SYMBOL(printk);
 
-#else
+#else /* CONFIG_PRINTK */
 
 #define LOG_LINE_MAX 0
+static u64 syslog_seq;
+static u32 syslog_idx;
+static enum log_flags syslog_prev;
+static u64 log_first_seq;
+static u32 log_first_idx;
+static u64 log_next_seq;
 static struct cont {
 	size_t len;
 	size_t cons;


