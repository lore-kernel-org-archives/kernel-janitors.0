From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 02:28:13 +0000
Subject: [cgroup:for-next 5/6] fs/xattr.c:882 __simple_xattr_set() error: potential NULL dereference 'new_xat
Message-Id: <20120912022813.GA17922@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Aristeu,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
head:   9814e970d7947dcc5ab7b37a53514c0098bfacc9
commit: 38f38657444d15e1a8574eae80ed3de9f501737a xattr: extract simple_xattr code from tmpfs


fs/xattr.c:882 __simple_xattr_set() error: potential NULL dereference 'new_xattr'.

vim +882 fs/xattr.c
   872				} else {
   873					list_del(&xattr->list);
   874				}
   875				goto out;
   876			}
   877		}
   878		if (flags & XATTR_REPLACE) {
   879			xattr = new_xattr;
   880			err = -ENODATA;
   881		} else {
 > 882			list_add(&new_xattr->list, &xattrs->head);
   883			xattr = NULL;
   884		}
   885	out:
   886		spin_unlock(&xattrs->lock);
   887		if (xattr) {
   888			kfree(xattr->name);
   889			kfree(xattr);
   890		}
   891		return err;
   892	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
