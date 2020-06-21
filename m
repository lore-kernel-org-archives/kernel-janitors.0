From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 21 Jun 2020 14:40:03 +0000
Subject: Re: [PATCH] arch/x86: Check return value from a notify_die() call
Message-Id: <ee99271a-6eb5-0dec-87d2-504b3ad4724d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo YU <tsu.yubo@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexandre Chartre <alexandre.chartre@oracle.com>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>

I propose to improve the previous patch subject.


> This is detected by Coverity scan: #CID: 1464472(CHECKED_RETURN)
>
> FIXES: c94082656dac7(x86: Use enum instead of literals for trap values)

Is the following tag specification more appropriate?

Fixes: c94082656dac7 ("x86: Use enum instead of literals for trap values")

Regards,
Markus
