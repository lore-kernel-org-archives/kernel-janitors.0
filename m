From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 08 May 2020 12:30:38 +0000
Subject: [PATCH 4.4 047/312] x86/apic/uv: Silence a shift wrapping warning
Message-Id: <20200508123127.863583911@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508123124.574959822@linuxfoundation.org>
In-Reply-To: <20200508123124.574959822@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Alex Thorlton <athorlton@sgi.com>, Dimitri Sivanich <sivanich@sgi.com>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Travis <travis@sgi.com>, Nathan Zimmer <nzimmer@sgi.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/x86/kernel/apic/x2apic_uv_x.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -648,9 +648,9 @@ static __init void map_mmioh_high_uv3(in
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
