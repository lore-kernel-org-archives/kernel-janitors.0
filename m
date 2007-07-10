From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 10 Jul 2007 12:05:56 +0000
Subject: another possible KJ project:  using routines from highmem.h
Message-Id: <Pine.LNX.4.64.0707100759440.17056@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  a quick perusal of the tree shows that there's potentially a number
of places where code could be simplified using static inlines or
macros from include/linux/highmem.h.

  for instance, consider this static inline from that header file:

static inline void clear_highpage(struct page *page)
{
        void *kaddr = kmap_atomic(page, KM_USER0);
        clear_page(kaddr);
        kunmap_atomic(kaddr, KM_USER0);
}

  as long as there's nothing more subtle happening here, that should
be an obvious replacement for things like this in drivers/kvm/vmx.c,
no?

	page = kmap_atomic(p2, KM_USER0);
	memset(page, 0, PAGE_SIZE);
	kunmap_atomic(page, KM_USER0);

correct?  as long as clear_page() is considered equivalent to a
memset of zero of size PAGE_SIZE at least, which is another potential
cleanup already documented here:

http://fsdev.net/wiki/index.php?title=Clear_page_copy_page

  i'll have a couple more questions later on other routines from
highmem.h.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
