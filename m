From: Joe Damato <ice799@gmail.com>
Date: Sun, 29 Mar 2009 21:21:41 +0000
Subject: [PATCH 1/2] x86: Add getter/setter static inlines for x86 descriptors
Message-Id: <76c37743d20e5737eadc747cbdddbc2beb11f074.1238361501.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1238361501.git.ice799@gmail.com>
In-Reply-To: <cover.1238361501.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, w@1wt.eu, mingo@elte.hu, hpa@zytor.com, jeremy@goop.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Static inline getters/setters have been provided to encourage consumers not to touch the internals of 32bit x86 descriptors directly.

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 arch/x86/include/asm/desc.h |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
index dc27705..c62cf93 100644
--- a/arch/x86/include/asm/desc.h
+++ b/arch/x86/include/asm/desc.h
@@ -44,6 +44,26 @@ static inline struct desc_struct *get_cpu_gdt_table(unsigned int cpu)
 	return per_cpu(gdt_page, cpu).gdt;
 }
 
+static inline void desc_set_lo(struct desc_struct *d, unsigned int lo)
+{
+	d->a = lo;
+}
+
+static inline void desc_set_hi(struct desc_struct *d, unsigned int hi)
+{
+	d->b = hi;
+}
+
+static inline unsigned int desc_get_lo(const struct desc_struct *d)
+{
+	return d->a;
+}
+
+static inline unsigned int desc_get_hi(const struct desc_struct *d)
+{
+	return d->b;
+}
+
 #ifdef CONFIG_X86_64
 
 static inline void pack_gate(gate_desc *gate, unsigned type, unsigned long func,
-- 
1.6.2

