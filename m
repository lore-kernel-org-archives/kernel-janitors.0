From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 08:05:36 +0000
Subject: [PATCH 0/4] x86/smpboot: Fine-tuning for smp_init_package_map()
Message-Id: <6dacb257-d15c-8ea1-9dd4-0440a5ecfd1d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Andi Kleen <ak@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Sep 2016 09:50:05 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use kmalloc_array()
  Return directly after a failed kmalloc_array()
  Replace one kzalloc() call by kcalloc()
  Return directly after a failed kcalloc()

 arch/x86/kernel/smpboot.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.9.3

