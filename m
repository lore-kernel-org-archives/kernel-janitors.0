From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 14 Oct 2018 15:25:41 +0000
Subject: [PATCH 3.16 307/366] KVM: Fix spelling mistake: "cop_unsuable" -> "cop_unusable"
Message-Id: <lsq.1539530741.988231619@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1539530740.755408431@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Ralf Baechle <ralf@linux-mips.org>, Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>

3.16.60-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Colin Ian King <colin.king@canonical.com>

commit ba3696e94d9d590d9a7e55f68e81c25dba515191 upstream.

Trivial fix to spelling mistake in debugfs_entries text.

Fixes: 669e846e6c4e ("KVM/MIPS32: MIPS arch specific APIs for KVM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: James Hogan <jhogan@kernel.org>
[bwh: Backported to 3.16: adjust filename, context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/mips/kvm/kvm_mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/kvm/kvm_mips.c
+++ b/arch/mips/kvm/kvm_mips.c
@@ -38,7 +38,7 @@ struct kvm_stats_debugfs_item debugfs_en
 	{ "cache", VCPU_STAT(cache_exits) },
 	{ "signal", VCPU_STAT(signal_exits) },
 	{ "interrupt", VCPU_STAT(int_exits) },
-	{ "cop_unsuable", VCPU_STAT(cop_unusable_exits) },
+	{ "cop_unusable", VCPU_STAT(cop_unusable_exits) },
 	{ "tlbmod", VCPU_STAT(tlbmod_exits) },
 	{ "tlbmiss_ld", VCPU_STAT(tlbmiss_ld_exits) },
 	{ "tlbmiss_st", VCPU_STAT(tlbmiss_st_exits) },
