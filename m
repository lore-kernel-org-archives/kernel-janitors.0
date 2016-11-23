From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Nov 2016 22:19:08 +0000
Subject: [patch] x86/apic/uv: silence a shift wrapping warning
Message-Id: <20161123221908.GA23997@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Mike Travis <travis@sgi.com>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Dimitri Sivanich <sivanich@sgi.com>, Nathan Zimmer <nzimmer@sgi.com>, Alex Thorlton <athorlton@sgi.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

m_io is stored in 6 bits so it's a number in the 0-63 range.  Static
analysis tools complain that 1 << 63 will wrap so I have changed it to
1ULL << m_io.

This code is over three years old so presumably the bug doesn't happen
very frequently in real life or someone would have complained by now.

Fixes: b15cc4a12bed ("x86, uv, uv3: Update x2apic Support for SGI UV3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this one, carefully because I'm not positive about it.

diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
index aeef53c..35690a1 100644
--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -815,9 +815,9 @@ static __init void map_mmioh_high_uv3(int index, int min_pnode, int max_pnode)
 				l = li;
 			}
 			addr1 = (base << shift) +
-				f * (unsigned long)(1 << m_io);
+				f * (1ULL << m_io);
 			addr2 = (base << shift) +
-				(l + 1) * (unsigned long)(1 << m_io);
+				(l + 1) * (1ULL << m_io);
 			pr_info("UV: %s[%03d..%03d] NASID 0x%04x ADDR 0x%016lx - 0x%016lx\n",
 				id, fi, li, lnasid, addr1, addr2);
 			if (max_io < l)
