From: Cripps <acripps@gmail.com>
Date: Tue, 15 May 2007 21:53:04 +0000
Subject: [KJ] pm_send_all() deprecation
Message-Id: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hey,
I've found the warning about pm_send_all() being marked for
deprecation ... it appears as though
this call is only used in arch/i386/kernel/apm.c and is declared in
include/pm_legacy.h as:
#ifdef CONFIG_PM_LEGACY
...
int __deprecated pm_send_all(pm_request_t, void* data);
#else
...
static inline int pm_send_all(pm_request_t rqst, void* data){ return 0;}
...
#endif


I wanted to tackle this as a first time patch, but there is one thing
I'm not entirely clear on:
How do I find out what this is to be replaced with (if there is
another function to replace it with), and if it's not meant to be
replaced, how would that be handled?

Thanks in advance for your help.
--Aaron Cripps
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
