From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 12:07:54 +0000
Subject: fscache: bug report: dereferencing before checking
Message-Id: <20100322120753.GE21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Can "page" be NULL here?

fs/fscache/page.c +712
   705          page = results[0];
   706          _debug("gang %d [%lx]", n, page->index);
                                           ^^^^^^^^^^^
	dereference

   707          if (page->index > op->store_limit) {
                    ^^^^^^^^^^^
	dereference

   708                  fscache_stat(&fscache_n_store_pages_over_limit);
   709                  goto superseded;
   710          }
   711
   712          if (page) {

	check

   713                  radix_tree_tag_set(&cookie->stores, page->index,
   714                                     FSCACHE_COOKIE_STORING_TAG);
   715                  radix_tree_tag_clear(&cookie->stores, page->index,
   716                                       FSCACHE_COOKIE_PENDING_TAG);
   717          }
   718
   719          spin_unlock(&cookie->stores_lock);
   720          spin_unlock(&object->lock);
   721
   722          if (page) {

	check

   723                  fscache_set_op_state(&op->op, "Store");

regards,
dan carpenter
