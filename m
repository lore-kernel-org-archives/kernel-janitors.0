From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 04 Oct 2012 07:06:23 +0000
Subject: [linus:master 98/99] drivers/base/firmware_class.c:72:28: sparse: incorrect type in argument 2 (diff
Message-Id: <20121004070623.GA31473@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Linus,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a494318b14b1bc0f59d2d6ce84c505c74d82d2a
commit: abb139e75c2cdbb955e840d6331cb5863e409d0e [98/99] firmware: teach the kernel to load firmware files directly from the filesystem

+ drivers/base/firmware_class.c:72:28: sparse: incorrect type in argument 2 (different address spaces)
  drivers/base/firmware_class.c:72:28:    expected char [noderef] <asn:1>*<noident>
  drivers/base/firmware_class.c:72:28:    got char *[assigned] buf

Shall we use kernel_read() in place of vfs_read()?

vim +72 drivers/base/firmware_class.c

abb139e7 (Linus Torvalds 2012-10-03  59) static bool fw_read_file_contents(struct file *file, struct firmware *fw)
abb139e7 (Linus Torvalds 2012-10-03  60) {
abb139e7 (Linus Torvalds 2012-10-03  61) 	loff_t pos;
abb139e7 (Linus Torvalds 2012-10-03  62) 	long size;
abb139e7 (Linus Torvalds 2012-10-03  63) 	char *buf;
abb139e7 (Linus Torvalds 2012-10-03  64) 
abb139e7 (Linus Torvalds 2012-10-03  65) 	size = fw_file_size(file);
abb139e7 (Linus Torvalds 2012-10-03  66) 	if (size < 0)
abb139e7 (Linus Torvalds 2012-10-03  67) 		return false;
abb139e7 (Linus Torvalds 2012-10-03  68) 	buf = vmalloc(size);
abb139e7 (Linus Torvalds 2012-10-03  69) 	if (!buf)
abb139e7 (Linus Torvalds 2012-10-03  70) 		return false;
abb139e7 (Linus Torvalds 2012-10-03  71) 	pos = 0;
abb139e7 (Linus Torvalds 2012-10-03 @72) 	if (vfs_read(file, buf, size, &pos) != size) {
abb139e7 (Linus Torvalds 2012-10-03  73) 		vfree(buf);
abb139e7 (Linus Torvalds 2012-10-03  74) 		return false;
abb139e7 (Linus Torvalds 2012-10-03  75) 	}
abb139e7 (Linus Torvalds 2012-10-03  76) 	fw->data = buf;
abb139e7 (Linus Torvalds 2012-10-03  77) 	fw->size = size;
abb139e7 (Linus Torvalds 2012-10-03  78) 	return true;
abb139e7 (Linus Torvalds 2012-10-03  79) }
abb139e7 (Linus Torvalds 2012-10-03  80) 

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
