From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 15 Feb 2017 22:41:40 +0000
Subject: [PATCH 3.16 259/306] x86/apic/uv: Silence a shift wrapping warning
Message-Id: <lsq.1487198500.252306363@decadent.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <lsq.1487198498.99718322@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Alex Thorlton <athorlton@sgi.com>, Ingo Molnar <mingo@kernel.org>, kernel-janitors@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Dimitri Sivanich <sivanich@sgi.com>, Dan Carpenter <dan.carpenter@oracle.com>, Mike Travis <travis@sgi.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Nathan Zimmer <nzimmer@sgi.com>

3.16.40-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Dan Carpenter <dan.carpenter@oracle.com>

commit c4597fd756836a5fb7900f2091797ab564390ad0 upstream.

'm_io' is stored in 6 bits so it's a number in the 0-63 range.  Static
analysis tools complain that 1 << 63 will wrap so I have changed it to
1ULL << m_io.

This code is over three years old so presumably the bug doesn't happen
very frequently in real life or someone would have complained by now.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Thorlton <athorlton@sgi.com>
Cc: Dimitri Sivanich <sivanich@sgi.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Travis <travis@sgi.com>
Cc: Nathan Zimmer <nzimmer@sgi.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org
Fixes: b15cc4a12bed ("x86, uv, uv3: Update x2apic Support for SGI UV3")
Link: http://lkml.kernel.org/r/20161123221908.GA23997@mwanda
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/x86/kernel/apic/x2apic_uv_x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -633,9 +633,9 @@ static __init void map_mmioh_high_uv3(in
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

