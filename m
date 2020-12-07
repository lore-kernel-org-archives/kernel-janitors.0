From: Christian Brauner <christian.brauner@ubuntu.com>
Date: Mon, 07 Dec 2020 13:04:49 +0000
Subject: Re: [PATCH] signal: propagate __user annotations properly
Message-Id: <20201207130449.nbt23aholqebbvux@wittgenstein>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207123610.18246-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201207123610.18246-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Christian Brauner <christian@brauner.io>, linux-kernel@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>, Kees Cook <keescook@chromium.org>, David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Serge Hallyn <serge@hallyn.com>, Aleksa Sarai <cyphar@cyphar.com>, kernel-janitors@vger.kernel.org

On Mon, Dec 07, 2020 at 01:36:10PM +0100, Lukas Bulwahn wrote:
> Commit 3eb39f47934f ("signal: add pidfd_send_signal() syscall") introduced
> copy_siginfo_from_user_any(), but missed to add the __user annotation to
> the user pointer that is passed as second argument.
> 
> Hence, when copy_siginfo_from_user_any() calls copy_siginfo_from_user(),
> sparse warns:
> 
>   kernel/signal.c:3716:46: warning: incorrect type in argument 2 (different address spaces)
>   kernel/signal.c:3716:46:    expected struct siginfo const [noderef] [usertype] __user *from
>   kernel/signal.c:3716:46:    got struct siginfo [usertype] *info
> 
> And when pidfd_send_signal() calls copy_siginfo_from_user_any(), sparse
> warns as well:
> 
>   kernel/signal.c:3776:58: warning: incorrect type in argument 2 (different address spaces)
>   kernel/signal.c:3776:58:    expected struct siginfo [usertype] *info
>   kernel/signal.c:3776:58:    got struct siginfo [noderef] [usertype] __user *info
> 
> Add the __user annotation to repair this chain of propagating __user
> annotations.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master (v5.10-rc7) and next-20201204
> 
> Christian, please pick this minor non-urgent clean-up patch.

Thanks for the patch. Unfortunately I already picked up Jann's patch who
sent it yesterday or this morning:
https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=pidfd

Thanks!
Christian
