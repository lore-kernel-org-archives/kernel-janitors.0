From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Thu, 18 Oct 2012 02:26:37 +0000
Subject: [shaggy:loop_v3 6/22] mm/iov-iter.c:137:8: sparse: symbol 'ii_bvec_copy_to_user_atomic' was not decl
Message-Id: <20121018022637.GD21995@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Zach,

FYI, there are new sparse warnings show up in

tree:   git://github.com/kleikamp/linux-shaggy loop_v3
head:   d6e600319940e6015af553f1515cee9d53a3ced9
commit: fa7902e69af5b98aee20c6788549a1423eabfd41 [6/22] iov_iter: add bvec support

  mm/iov-iter.c:40:8: sparse: symbol 'ii_iovec_copy_to_user_atomic' was not declared. Should it be static?
  mm/iov-iter.c:69:8: sparse: symbol 'ii_iovec_copy_to_user' was not declared. Should it be static?
+ mm/iov-iter.c:137:8: sparse: symbol 'ii_bvec_copy_to_user_atomic' was not declared. Should it be static?
+ mm/iov-iter.c:142:8: sparse: symbol 'ii_bvec_copy_to_user' was not declared. Should it be static?
+ mm/iov-iter.c:147:8: sparse: symbol 'ii_bvec_copy_from_user_atomic' was not declared. Should it be static?
+ mm/iov-iter.c:152:8: sparse: symbol 'ii_bvec_copy_from_user' was not declared. Should it be static?
+ mm/iov-iter.c:162:6: sparse: symbol 'ii_bvec_advance' was not declared. Should it be static?
+ mm/iov-iter.c:189:5: sparse: symbol 'ii_bvec_fault_in_readable' was not declared. Should it be static?
+ mm/iov-iter.c:194:8: sparse: symbol 'ii_bvec_single_seg_count' was not declared. Should it be static?
  mm/iov-iter.c:244:8: sparse: symbol 'ii_iovec_copy_from_user_atomic' was not declared. Should it be static?
  mm/iov-iter.c:274:8: sparse: symbol 'ii_iovec_copy_from_user' was not declared. Should it be static?
  mm/iov-iter.c:295:6: sparse: symbol 'ii_iovec_advance' was not declared. Should it be static?
  mm/iov-iter.c:340:5: sparse: symbol 'ii_iovec_fault_in_readable' was not declared. Should it be static?
  mm/iov-iter.c:351:8: sparse: symbol 'ii_iovec_single_seg_count' was not declared. Should it be static?

vim +137 mm/iov-iter.c

fa7902e6 Zach Brown 2012-10-15  121  			       copy);
fa7902e6 Zach Brown 2012-10-15  122  		kunmap_atomic(bvec_map);
fa7902e6 Zach Brown 2012-10-15  123  		remaining -= copy;
fa7902e6 Zach Brown 2012-10-15  124  		bvec_offset += copy;
fa7902e6 Zach Brown 2012-10-15  125  		page_offset += copy;
fa7902e6 Zach Brown 2012-10-15  126  		if (bvec_offset = bvec->bv_len) {
fa7902e6 Zach Brown 2012-10-15  127  			bvec_offset = 0;
fa7902e6 Zach Brown 2012-10-15  128  			bvec++;
fa7902e6 Zach Brown 2012-10-15  129  		}
fa7902e6 Zach Brown 2012-10-15  130  	}
fa7902e6 Zach Brown 2012-10-15  131  
fa7902e6 Zach Brown 2012-10-15  132  	kunmap_atomic(page_map);
fa7902e6 Zach Brown 2012-10-15  133  
fa7902e6 Zach Brown 2012-10-15  134  	return bytes;
fa7902e6 Zach Brown 2012-10-15  135  }
fa7902e6 Zach Brown 2012-10-15  136  
fa7902e6 Zach Brown 2012-10-15 @137  size_t ii_bvec_copy_to_user_atomic(struct page *page, struct iov_iter *i,
fa7902e6 Zach Brown 2012-10-15  138  				   unsigned long offset, size_t bytes)
fa7902e6 Zach Brown 2012-10-15  139  {
fa7902e6 Zach Brown 2012-10-15  140  	return bvec_copy_tofrom_page(i, page, offset, bytes, 0);
fa7902e6 Zach Brown 2012-10-15  141  }
fa7902e6 Zach Brown 2012-10-15  142  size_t ii_bvec_copy_to_user(struct page *page, struct iov_iter *i,
fa7902e6 Zach Brown 2012-10-15  143  				   unsigned long offset, size_t bytes)
fa7902e6 Zach Brown 2012-10-15  144  {
fa7902e6 Zach Brown 2012-10-15  145  	return bvec_copy_tofrom_page(i, page, offset, bytes, 0);

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
