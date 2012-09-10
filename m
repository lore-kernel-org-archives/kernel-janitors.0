From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Sep 2012 10:21:07 +0000
Subject: [patch 3/3 v2] xen/privcmd: add a __user annotation to a cast
Message-Id: <20120910102107.GA27456@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <504DC8FE020000780009A190@nat28.tlf.novell.com>
In-Reply-To: <504DC8FE020000780009A190@nat28.tlf.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Lagar-Cavilla <andreslc@gridcentric.ca>
Cc: kernel-janitors@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Sparse complains that we lose the __user annotation in the cast here.

drivers/xen/privcmd.c:388:35: warning: cast removes address space of expression
drivers/xen/privcmd.c:388:32: warning: incorrect type in assignment (different address spaces)
drivers/xen/privcmd.c:388:32:    expected unsigned long [noderef] [usertype] <asn:1>*[addressable] [assigned] user_mfn
drivers/xen/privcmd.c:388:32:    got unsigned long [usertype] *<noident>

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In v1 I removed the const from the declaration but now I just removed it
from the cast.  This data can either be a v1 or a v2 type struct.  The m.arr
data is const in version 2 but not in version 1.

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 0ce006a..fceb83e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -389,7 +389,7 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
 
 	if (state.global_error && (version = 1)) {
 		/* Write back errors in second pass. */
-		state.user_mfn = (xen_pfn_t *)m.arr;
+		state.user_mfn = (xen_pfn_t __user *)m.arr;
 		state.err      = err_array;
 		ret = traverse_pages(m.num, sizeof(xen_pfn_t),
 				     &pagelist, mmap_return_errors_v1, &state);
