From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 28 Jun 2015 06:52:46 +0000
Subject: LIBCFS_ALLOC
Message-Id: <alpine.DEB.2.02.1506280844460.2103@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr> <1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr> <D1AECA61.F8DE5%andreas.dilger@intel.com>
In-Reply-To: <D1AECA61.F8DE5%andreas.dilger@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Dilger, Andreas" <andreas.dilger@intel.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, "Drokin, Oleg" <oleg.drokin@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

It is not clear that all of the uses of LIBCFS_ALLOC really risk needing 
vmalloc.  For example:

lnet/klnds/socklnd/socklnd.c, function ksocknal_accept:

ksock_connreq_t *cr;
...
LIBCFS_ALLOC(cr, sizeof(*cr));

The definition of ksock_connreq_t is:

typedef struct ksock_connreq {
        struct list_head ksncr_list;  /* stash on ksnd_connd_connreqs */
        lnet_ni_t        *ksncr_ni;   /* chosen NI */
        struct socket    *ksncr_sock; /* accepted socket */
} ksock_connreq_t;

This looks like a very small structure.

LIBCFS_ALLOC relies on a test on the size, which should be able to be 
compiled away.  libcfs_kvzalloc on the other hand relies on the failure of 
kmalloc and so the test for that won't be compiled away.

Does it matter?

julia
