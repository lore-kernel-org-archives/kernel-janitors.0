From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jan 2017 08:26:08 +0000
Subject: [patch v2 linux-next] userfaultfd: hugetlbfs: unmap the correct pointer
Message-Id: <20170113082608.GA3548@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170112193327.GB8558@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Jan Kara <jack@suse.cz>, Ross Zwisler <ross.zwisler@linux.intel.com>, Michal Hocko <mhocko@suse.com>, Lorenzo Stoakes <lstoakes@gmail.com>, Dan Williams <dan.j.williams@intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

kunmap_atomic() and kunmap() take different pointers.  People often get
these mixed up.

Fixes: 16374db2e9a0 ("userfaultfd: hugetlbfs: fix __mcopy_atomic_hugetlb retry/error processing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I was also unmapping the wrong pointer because I had a typo.

diff --git a/mm/memory.c b/mm/memory.c
index 6012a05..aca8ef6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4172,7 +4172,7 @@ long copy_huge_page_from_user(struct page *dst_page,
 				(const void __user *)(src + i * PAGE_SIZE),
 				PAGE_SIZE);
 		if (allow_pagefault)
-			kunmap(page_kaddr);
+			kunmap(page_kaddr + i);
 		else
 			kunmap_atomic(page_kaddr);
 
