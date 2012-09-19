From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 05:08:02 +0000
Subject: [cifs:for-next 50/71] fs/cifs/file.c:3157:23-27: ERROR: invalid reference to the index variable of t
Message-Id: <20120919050802.GA28801@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jeff,

FYI, there are new coccinelle warnings show up in

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   324b53bbcd1d9795062f00e92064296169c9b081
commit: a4a23914d0d1736eb6d98049d303d551131df83c [50/71] cifs: turn the pages list in cifs_readdata into an array

All coccinelle warnings:

+ fs/cifs/file.c:3157:23-27: ERROR: invalid reference to the index variable of the iterator on line 3149

vim +3157 fs/cifs/file.c
  3147			rdata->marshal_iov = cifs_readpages_marshal_iov;
  3148	
> 3149			list_for_each_entry_safe(page, tpage, &tmplist, lru) {
  3150				list_del(&page->lru);
  3151				rdata->pages[rdata->nr_pages++] = page;
  3152			}
  3153	
  3154			rc = cifs_retry_async_readv(rdata);
  3155			if (rc != 0) {
  3156				for (i = 0; i < rdata->nr_pages; i++) {
> 3157					lru_cache_add_file(page);
  3158					unlock_page(page);
  3159					page_cache_release(page);
  3160				}
  3161				kref_put(&rdata->refcount, cifs_readdata_release);
  3162				break;
  3163			}
  3164	
  3165			kref_put(&rdata->refcount, cifs_readdata_release);
  3166		}
  3167	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
