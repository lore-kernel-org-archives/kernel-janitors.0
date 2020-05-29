From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 18:50:15 +0000
Subject: Re: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error message
Message-Id: <c3d22d89-9133-30aa-8270-c515df214963@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>, Liao Pingfang <liao.pingfang@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>, Wang Liang <wang.liang82@zte.com.cn>, Anton Vorontsov <anton@enomsg.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>, Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>

> Please just remove the message instead, it's a tiny allocation that's
> unlikely to ever fail, and the caller will print an error anyway.

How do you think about to take another look at a previous update suggestion
like the following?

powerpc/nvram: Delete three error messages for a failed memory allocation
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
https://lore.kernel.org/linuxppc-dev/00845261-8528-d011-d3b8-e9355a231d3a@users.sourceforge.net/
https://lore.kernel.org/patchwork/patch/752720/
https://lkml.org/lkml/2017/1/19/537

Regards,
Markus
