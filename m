From: Borislav Petkov <bp@alien8.de>
Date: Fri, 11 Dec 2020 18:47:15 +0000
Subject: Re: [PATCH] x86: ia32_setup_rt_frame(): propagate __user annotations properly
Message-Id: <20201211184715.GE25974@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207124141.21859-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201207124141.21859-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Al Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 07, 2020 at 01:41:41PM +0100, Lukas Bulwahn wrote:
> Thomas, Ingo, Boris, please pick this minor non-urgent clean-up patch.

Why?

Isn't it obvious that when you send a patch to us, the final goal is for
it to be applied. Eventually.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
