From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2020 12:27:44 +0000
Subject: [PATCH] x86/resctrl: fix a NULL vs IS_ERR() static checker warning
Message-Id: <20200529122744.GA1217265@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fenghua Yu <fenghua.yu@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The callers don't expect *d_cdp to be set to an error pointer, they only
check for NULL.  This leads to a static checker warning:

    arch/x86/kernel/cpu/resctrl/rdtgroup.c:2648 __init_one_rdt_domain()
    warn: 'd_cdp' could be an error pointer

I don't think this will lead to a real life bug, but it's easy enough to
change it to be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 23b4b61319d3f..3f844f14fc0a6 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1117,6 +1117,7 @@ static int rdt_cdp_peer_get(struct rdt_resource *r, struct rdt_domain *d,
 	_d_cdp = rdt_find_domain(_r_cdp, d->id, NULL);
 	if (WARN_ON(IS_ERR_OR_NULL(_d_cdp))) {
 		_r_cdp = NULL;
+		_d_cdp = NULL;
 		ret = -EINVAL;
 	}
 
-- 
2.26.2
