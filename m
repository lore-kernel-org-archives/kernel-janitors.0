From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 17:33:08 +0000
Subject: [PATCH] cgroup: Replace a seq_printf() call by seq_puts() in cgroup_print_ss_mask()
Message-Id: <bded6e4b-7fa6-b361-cf79-260a6ce679bb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d465ca81-a870-b88c-0ea2-5e8bfbefb79d@web.de>
In-Reply-To: <d465ca81-a870-b88c-0ea2-5e8bfbefb79d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: cgroups@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 19:26:59 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/cgroup/cgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 300b0c416341..9d04e3004e3b 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -2851,7 +2851,7 @@ static void cgroup_print_ss_mask(struct seq_file *seq, u16 ss_mask)
 	do_each_subsys_mask(ss, ssid, ss_mask) {
 		if (printed)
 			seq_putc(seq, ' ');
-		seq_printf(seq, "%s", ss->name);
+		seq_puts(seq, ss->name);
 		printed = true;
 	} while_each_subsys_mask();
 	if (printed)
--
2.22.0
