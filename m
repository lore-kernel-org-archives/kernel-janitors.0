From: "liran tal" <liransgarage@gmail.com>
Date: Tue, 11 Sep 2007 09:55:13 +0000
Subject: [KJ] [PATCH 1/1] net/netfilter/x_tables.c unnecessary casts
Message-Id: <3ed55890709110255w7c1475ffidf75ebc25f47d541@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch removes an unnecessary cast in accordance to the rest of
the code. Kernel version is 2.6.22 with latest patches.


--- x_tables.c  2007-09-11 11:22:11.000000000 +0300
+++ x_tables.c.orig     2007-09-11 11:21: 44.000000000 +0300
@@ -691,7 +691,7 @@ static struct list_head *type2list(u_int

 static void *xt_tgt_seq_start(struct seq_file *seq, loff_t *pos)
 {
-       struct proc_dir_entry *pde = seq->private;
+       struct proc_dir_entry *pde = (struct proc_dir_entry *) seq->private;
        u_int16_t af = (unsigned long)pde->data & 0xffff;
        u_int16_t type = (unsigned long)pde->data >> 16;
        struct list_head *list;


Signed-off-by: Liran Tal <liran.tal@gmail.com<lists-receive@programmierforen.de>
>
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
