From: Colin King <colin.king@canonical.com>
Date: Mon, 14 May 2018 17:23:50 +0000
Subject: [PATCH] KVM: fix spelling mistake: "cop_unsuable" -> "cop_unusable"
Message-Id: <20180514172350.26601-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in debugfs_entries text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 2549fdd27ee1..0f725e9cee8f 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -45,7 +45,7 @@ struct kvm_stats_debugfs_item debugfs_entries[] = {
 	{ "cache",	  VCPU_STAT(cache_exits),	 KVM_STAT_VCPU },
 	{ "signal",	  VCPU_STAT(signal_exits),	 KVM_STAT_VCPU },
 	{ "interrupt",	  VCPU_STAT(int_exits),		 KVM_STAT_VCPU },
-	{ "cop_unsuable", VCPU_STAT(cop_unusable_exits), KVM_STAT_VCPU },
+	{ "cop_unusable", VCPU_STAT(cop_unusable_exits), KVM_STAT_VCPU },
 	{ "tlbmod",	  VCPU_STAT(tlbmod_exits),	 KVM_STAT_VCPU },
 	{ "tlbmiss_ld",	  VCPU_STAT(tlbmiss_ld_exits),	 KVM_STAT_VCPU },
 	{ "tlbmiss_st",	  VCPU_STAT(tlbmiss_st_exits),	 KVM_STAT_VCPU },
-- 
2.17.0

