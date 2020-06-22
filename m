From: Bo YU <tsu.yubo@gmail.com>
Date: Mon, 22 Jun 2020 00:50:08 +0000
Subject: Re: [PATCH] arch/x86: Check return value from a notify_die() call
Message-Id: <CAKq8=3LaX0tWs0BfdpCYvKRRz5Cqv4cOXo1wcVvpY72cQA8RGA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee99271a-6eb5-0dec-87d2-504b3ad4724d@web.de>
In-Reply-To: <ee99271a-6eb5-0dec-87d2-504b3ad4724d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Alexandre Chartre <alexandre.chartre@oracle.com>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>

On Sun, Jun 21, 2020 at 10:40 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> I propose to improve the previous patch subject.
>
>
> > This is detected by Coverity scan: #CID: 1464472(CHECKED_RETURN)
> >
> > FIXES: c94082656dac7(x86: Use enum instead of literals for trap values)
>
> Is the following tag specification more appropriate?
>
> Fixes: c94082656dac7 ("x86: Use enum instead of literals for trap values")
Your description looks like more appropriate, thank you.
But I want to receive suggestions from other reviewers also. So I will
send V2 patch as your point
once got confirmed. Sorry.
>
> Regards,
> Markus
