From: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Date: Mon, 13 May 2013 13:53:11 +0000
Subject: RE: [patch] NVMe: check for integer overflow in nvme_map_user_pages()
Message-Id: <100D68C7BA14664A8938383216E40DE027F80EAB@fmsmsx111.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130511163155.GA21427@elgon.mountain>
In-Reply-To: <20130511163155.GA21427@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Busch, Keith" <keith.busch@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Why didn't you send this patch to the linux-nvme mailing list or the address listed in MAINTAINERS?  Now Exchange & Outlook have hold of it, and it's mangled.

NVM EXPRESS DRIVER
M:      Matthew Wilcox <willy@linux.intel.com>
L:      linux-nvme@lists.infradead.org

________________________________________
From: Dan Carpenter [dan.carpenter@oracle.com]
Sent: May 11, 2013 9:31 AM
To: Wilcox, Matthew R
Cc: Busch, Keith; Verma, Vishal L; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Subject: [patch] NVMe: check for integer overflow in nvme_map_user_pages()

You need to have CAP_SYS_ADMIN to trigger this overflow but it makes the
static checkers complain so we should fix it.  The worry is that
"length" comes from copy_from_user() so we need to check that "length +
offset" can't overflow.

I also changed the min_t() cast to be unsigned instead of signed.  Now
that we cap "length" to INT_MAX it doesn't make a difference, but it's a
little easier for reviewers to know that large values aren't cast to
negative.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/nvme-core.c b/drivers/block/nvme-core.c
index 8efdfaa..4376375 100644
--- a/drivers/block/nvme-core.c
+++ b/drivers/block/nvme-core.c
@@ -1206,7 +1206,7 @@ struct nvme_iod *nvme_map_user_pages(struct nvme_dev *dev, int write,

        if (addr & 3)
                return ERR_PTR(-EINVAL);
-       if (!length)
+       if (!length || length > INT_MAX - PAGE_SIZE)
                return ERR_PTR(-EINVAL);

        offset = offset_in_page(addr);
@@ -1227,7 +1227,8 @@ struct nvme_iod *nvme_map_user_pages(struct nvme_dev *dev, int write,
        sg_init_table(sg, count);
        for (i = 0; i < count; i++) {
                sg_set_page(&sg[i], pages[i],
-                               min_t(int, length, PAGE_SIZE - offset), offset);
+                           min_t(unsigned, length, PAGE_SIZE - offset),
+                           offset);
                length -= (PAGE_SIZE - offset);
                offset = 0;
        }
