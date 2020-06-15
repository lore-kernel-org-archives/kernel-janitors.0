From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Jun 2020 08:26:36 +0000
Subject: [PATCH] KVM: MIPS: fix spelling mistake "Exteneded" -> "Extended"
Message-Id: <20200615082636.7004-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a couple of kvm_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/kvm/emulate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 5ae82d925197..d3d322f70fe0 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -1861,7 +1861,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 				  vcpu->arch.gprs[rt], *(u64 *)data);
 			break;
 		default:
-			kvm_err("Godson Exteneded GS-Store not yet supported (inst=0x%08x)\n",
+			kvm_err("Godson Extended GS-Store not yet supported (inst=0x%08x)\n",
 				inst.word);
 			break;
 		}
@@ -2103,7 +2103,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 			vcpu->mmio_needed = 30;	/* signed */
 			break;
 		default:
-			kvm_err("Godson Exteneded GS-Load for float not yet supported (inst=0x%08x)\n",
+			kvm_err("Godson Extended GS-Load for float not yet supported (inst=0x%08x)\n",
 				inst.word);
 			break;
 		}
-- 
2.27.0.rc0
