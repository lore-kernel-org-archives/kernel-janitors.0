From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 11 Dec 2020 18:55:50 +0000
Subject: Re: [PATCH] x86: ia32_setup_rt_frame(): propagate __user annotations properly
Message-Id: <CAKXUXMzZ7ejn1JrznDP6d7dk8tSsTznBO+423NAwf_nYsix=_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207124141.21859-1-lukas.bulwahn@gmail.com> <20201211184715.GE25974@zn.tnic>
In-Reply-To: <20201211184715.GE25974@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 11, 2020 at 7:47 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Dec 07, 2020 at 01:41:41PM +0100, Lukas Bulwahn wrote:
> > Thomas, Ingo, Boris, please pick this minor non-urgent clean-up patch.
>
> Why?
>
> Isn't it obvious that when you send a patch to us, the final goal is for
> it to be applied. Eventually.
>

Yes, agree. Other maintainers noted that I should point out that the
patch is only a minor clean-up and it is not urgent to be considered.

So, I add this remark to make clear that it is not top priority to
apply just that the maintainers know.

You will sure review it eventually, and hopefully accept it then.

If that comment disturbs you, please ignore it.

Lukas
