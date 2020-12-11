From: Borislav Petkov <bp@alien8.de>
Date: Fri, 11 Dec 2020 19:02:00 +0000
Subject: Re: [PATCH] x86: ia32_setup_rt_frame(): propagate __user annotations properly
Message-Id: <20201211190200.GF25974@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207124141.21859-1-lukas.bulwahn@gmail.com>
 <20201211184715.GE25974@zn.tnic>
 <CAKXUXMzZ7ejn1JrznDP6d7dk8tSsTznBO+423NAwf_nYsix=_w@mail.gmail.com>
In-Reply-To: <CAKXUXMzZ7ejn1JrznDP6d7dk8tSsTznBO+423NAwf_nYsix=_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Dec 11, 2020 at 07:55:50PM +0100, Lukas Bulwahn wrote:
> Yes, agree. Other maintainers noted that I should point out that the
> patch is only a minor clean-up and it is not urgent to be considered.
> 
> So, I add this remark to make clear that it is not top priority to
> apply just that the maintainers know.
> 
> You will sure review it eventually, and hopefully accept it then.

Well, after I review it, I probably should know what the priority is,
right?

> If that comment disturbs you, please ignore it.

I was just wondering why you're writing something which is not really
needed. Notes under "---" are usually used to clarify aspects of the
patch handling, versioning, etc.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
