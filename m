From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 08:11:21 +0000
Subject: [PATCH 2/4] x86/smpboot: Return directly after a failed kmalloc_array()
Message-Id: <ce4252db-9b91-d29a-8b45-d3996dd818ff@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
In-Reply-To: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Andi Kleen <ak@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Sep 2016 08:48:32 +0200

Return directly after a memory allocation failed at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 36cf27e..2ce06ef 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -352,6 +352,8 @@ static void __init smp_init_package_map(void)
 	physical_to_logical_pkg = kmalloc_array(max_physical_pkg_id,
 						sizeof(*physical_to_logical_pkg),
 						GFP_KERNEL);
+	if (!physical_to_logical_pkg)
+		return;
 	memset(physical_to_logical_pkg,
 	       0xff,
 	       sizeof(*physical_to_logical_pkg) * max_physical_pkg_id);
-- 
2.9.3

