From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 22 Jun 2020 06:50:59 +0000
Subject: Re: [PATCH] arch/x86: Check return value from a notify_die() call
Message-Id: <615f79c5-5ca8-9dad-9ef7-85d8513a3e1b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee99271a-6eb5-0dec-87d2-504b3ad4724d@web.de>
 <CAKq8=3LaX0tWs0BfdpCYvKRRz5Cqv4cOXo1wcVvpY72cQA8RGA@mail.gmail.com>
In-Reply-To: <CAKq8=3LaX0tWs0BfdpCYvKRRz5Cqv4cOXo1wcVvpY72cQA8RGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bo YU <tsu.yubo@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexandre Chartre <alexandre.chartre@oracle.com>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>

>>> This is detected by Coverity scan: #CID: 1464472(CHECKED_RETURN)

Can an additional imperative wording be helpful for the change description
(besides an adjusted patch subject)?


>>> FIXES: c94082656dac7(x86: Use enum instead of literals for trap values)
>>
>> Is the following tag specification more appropriate?
>>
>> Fixes: c94082656dac7 ("x86: Use enum instead of literals for trap values")
> Your description looks like more appropriate, thank you.

Thanks for your positive feedback.


> But I want to receive suggestions from other reviewers also. So I will
> send V2 patch as your point once got confirmed. Sorry.

Should the confirmation be sufficient from the available software documentation?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idb5d3449788f85569096780592549d0340e9c0c7#n183

I am curious if this patch review will clarify more aspects.

Regards,
Markus
