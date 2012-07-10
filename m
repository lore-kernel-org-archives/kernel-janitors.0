From: wfg@linux.intel.com
Date: Tue, 10 Jul 2012 00:15:09 +0000
Subject: [driver-core:driver-core-linus 6/6] 'syslog_partial' defined but not used on !CONFIG_PRINTK
Message-Id: <20120710001509.GD5584@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kay,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-linus
head:   eb02dac93708f581c99858a19162af8ca2b6bfcb
commit: eb02dac93708f581c99858a19162af8ca2b6bfcb [6/6] kmsg: /proc/kmsg - support reading of partial log records

All warnings:

kernel/printk.c:220:15: warning: 'syslog_partial' defined but not used [-Wunused-variable]

vim +220 kernel/printk.c
   217	/* the next printk record to read by syslog(READ) or /proc/kmsg */
   218	static u64 syslog_seq;
   219	static u32 syslog_idx;
 > 220	static size_t syslog_partial;
   221	
   222	/* index and sequence number of the first record stored in the buffer */
   223	static u64 log_first_seq;

The problem is, syslog_partial is defined outside of CONFIG_PRINTK and
used inside it:

static size_t syslog_partial;
#ifdef CONFIG_PRINTK
                        syslog_partial = 0;
                skip = syslog_partial;
                if (n - syslog_partial <= size) {
                        n -= syslog_partial;
                        syslog_partial = 0;
                        syslog_partial += n;
int do_syslog(int type, char __user *buf, int len, bool from_file)
                        syslog_partial = 0;
                        error -= syslog_partial;
        return do_syslog(type, buf, len, SYSLOG_FROM_CALL);
#endif /* CONFIG_PRINTK */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
