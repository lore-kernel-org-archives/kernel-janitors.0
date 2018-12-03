From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:48:35 +0000
Subject: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kim Phillips <kim.phillips@freescale.com>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

The ipic_info[] array only has 95 elements so I have made the bounds
check smaller to prevent a read overflow.  It was Smatch that found
this issue:

    arch/powerpc/sysdev/ipic.c:784 ipic_set_priority()
    error: buffer overflow 'ipic_info' 95 <= 127

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I wasn't able to find any callers of this code.  Maybe we removed the
last one in commit b9f0f1bb2bca ("[POWERPC] Adapt ipic driver to new
host_ops interface, add set_irq_type to set IRQ sense").  So perhaps we
should just remove it.  I'm not really comfortable doing that myself,
because I don't know the code well enough and can't build test
it properly.

 arch/powerpc/sysdev/ipic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 6300123ce965..9d70d0687cd9 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -779,7 +779,7 @@ int ipic_set_priority(unsigned int virq, unsigned int priority)
 
 	if (priority > 7)
 		return -EINVAL;
-	if (src > 127)
+	if (src >= ARRAY_SIZE(ipic_info))
 		return -EINVAL;
 	if (ipic_info[src].prio = 0)
 		return -EINVAL;
-- 
2.11.0
