From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 07 Dec 2020 13:06:17 +0000
Subject: Re: [PATCH] signal: propagate __user annotations properly
Message-Id: <CAKXUXMyC163hWT-bf=Nbw3KQspYWo_oTCNBYH-Di5ky+NU190A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207123610.18246-1-lukas.bulwahn@gmail.com> <20201207130449.nbt23aholqebbvux@wittgenstein>
In-Reply-To: <20201207130449.nbt23aholqebbvux@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Christian Brauner <christian@brauner.io>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>, Kees Cook <keescook@chromium.org>, David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Serge Hallyn <serge@hallyn.com>, Aleksa Sarai <cyphar@cyphar.com>, kernel-janitors@vger.kernel.org

On Mon, Dec 7, 2020 at 2:04 PM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> On Mon, Dec 07, 2020 at 01:36:10PM +0100, Lukas Bulwahn wrote:
> > Commit 3eb39f47934f ("signal: add pidfd_send_signal() syscall") introduced
> > copy_siginfo_from_user_any(), but missed to add the __user annotation to
> > the user pointer that is passed as second argument.
> >
> > Hence, when copy_siginfo_from_user_any() calls copy_siginfo_from_user(),
> > sparse warns:
> >
> >   kernel/signal.c:3716:46: warning: incorrect type in argument 2 (different address spaces)
> >   kernel/signal.c:3716:46:    expected struct siginfo const [noderef] [usertype] __user *from
> >   kernel/signal.c:3716:46:    got struct siginfo [usertype] *info
> >
> > And when pidfd_send_signal() calls copy_siginfo_from_user_any(), sparse
> > warns as well:
> >
> >   kernel/signal.c:3776:58: warning: incorrect type in argument 2 (different address spaces)
> >   kernel/signal.c:3776:58:    expected struct siginfo [usertype] *info
> >   kernel/signal.c:3776:58:    got struct siginfo [noderef] [usertype] __user *info
> >
> > Add the __user annotation to repair this chain of propagating __user
> > annotations.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on current master (v5.10-rc7) and next-20201204
> >
> > Christian, please pick this minor non-urgent clean-up patch.
>
> Thanks for the patch. Unfortunately I already picked up Jann's patch who
> sent it yesterday or this morning:
> https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=pidfd
>

Thanks for letting me know and good to know that Jann is tracking
those sparse warnings as well :)

Lukas
