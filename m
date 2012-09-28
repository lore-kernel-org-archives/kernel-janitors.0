From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 11:17:24 +0000
Subject: [glommer-memcg:slab-common/kmalloc 27/30] fs/proc/stat.c:191:3: warning: large integer implicitly tr
Message-Id: <20120928111724.GC31784@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Christoph,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/kmalloc
head:   f957c1ead131972db578b945e25982f4607da6ba
commit: 1265e4cd1545c612bd0397d3d83fff5301a4beb4 [27/30] CK1 [11/13] Common constants for kmalloc boundaries
config: ia64-defconfig

All warnings:

fs/proc/stat.c: In function 'stat_open':
fs/proc/stat.c:191:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]

vim +191 fs/proc/stat.c

df8106db (Alexey Dobriyan 2008-10-05  179) static int stat_open(struct inode *inode, struct file *file)
df8106db (Alexey Dobriyan 2008-10-05  180) {
59a32e2c (Eric Dumazet    2012-03-23  181) 	unsigned size = 1024 + 128 * num_possible_cpus();
df8106db (Alexey Dobriyan 2008-10-05  182) 	char *buf;
df8106db (Alexey Dobriyan 2008-10-05  183) 	struct seq_file *m;
df8106db (Alexey Dobriyan 2008-10-05  184) 	int res;
df8106db (Alexey Dobriyan 2008-10-05  185) 
59a32e2c (Eric Dumazet    2012-03-23  186) 	/* minimum size to display an interrupt count : 2 bytes */
59a32e2c (Eric Dumazet    2012-03-23  187) 	size += 2 * nr_irqs;
59a32e2c (Eric Dumazet    2012-03-23  188) 
a4dbf0ec (Yuanhan Liu     2011-05-26  189) 	/* don't ask for more than the kmalloc() max size */
a4dbf0ec (Yuanhan Liu     2011-05-26  190) 	if (size > KMALLOC_MAX_SIZE)
a4dbf0ec (Yuanhan Liu     2011-05-26 @191) 		size = KMALLOC_MAX_SIZE;
df8106db (Alexey Dobriyan 2008-10-05  192) 	buf = kmalloc(size, GFP_KERNEL);
df8106db (Alexey Dobriyan 2008-10-05  193) 	if (!buf)
df8106db (Alexey Dobriyan 2008-10-05  194) 		return -ENOMEM;
df8106db (Alexey Dobriyan 2008-10-05  195) 
df8106db (Alexey Dobriyan 2008-10-05  196) 	res = single_open(file, show_stat, NULL);
df8106db (Alexey Dobriyan 2008-10-05  197) 	if (!res) {
df8106db (Alexey Dobriyan 2008-10-05  198) 		m = file->private_data;
df8106db (Alexey Dobriyan 2008-10-05  199) 		m->buf = buf;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
