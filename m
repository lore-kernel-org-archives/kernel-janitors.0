From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:34:09 +0000
Subject: [patch] x86/cache_info: use ARRAY_SIZE() in amd_l3_attrs()
Message-Id: <20121002083409.GM12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Shai Fultheim <shai@scalemp.com>, Greg Kroah-Hartman <gregkh@suse.de>, Andreas Herrmann <andreas.herrmann3@amd.com>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Using ARRAY_SIZE() is more readable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/intel_cacheinfo.c b/arch/x86/kernel/cpu/intel_cacheinfo.c
index 9a7c90d..93c5451 100644
--- a/arch/x86/kernel/cpu/intel_cacheinfo.c
+++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
@@ -991,7 +991,7 @@ static struct attribute ** __cpuinit amd_l3_attrs(void)
 	if (attrs)
 		return attrs;
 
-	n = sizeof (default_attrs) / sizeof (struct attribute *);
+	n = ARRAY_SIZE(default_attrs);
 
 	if (amd_nb_has_feature(AMD_NB_L3_INDEX_DISABLE))
 		n += 2;
