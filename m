From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 21:15:53 +0000
Subject: Re: [patch] orangefs: cleanup orangefs_debugfs_new_client_string()
Message-Id: <20161216211553.GI8176@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161216104524.GA2637@elgon.mountain>
 <CAOg9mSQqO1ABRQ==0hoorBDZGt9yO0Byh8c3k8h1M9X5YPXq3A@mail.gmail.com>
In-Reply-To: <CAOg9mSQqO1ABRQ==0hoorBDZGt9yO0Byh8c3k8h1M9X5YPXq3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>

So the story with this patch is that I was looking at the code for
unrelated reasons and I was just dorking in my editor and decided to
click send at the end.  I often muck about and then just decide to move
on without hitting send.  It's not something I feel strongly about.

On Fri, Dec 16, 2016 at 03:35:34PM -0500, Mike Marshall wrote:
> 2) Some system administrators have admonished me because
>    of a place where I put annoying messages into the ring
>    buffer when a particular error occurs during op processing.
>    I liked seeing it during development, but on a busy production cluster
>    filled with people hitting CTRL-C and whatever else people whimsically
>    do, there were thousands of "No one's waiting for tag #such-and-such"
>    messages in dmesg and syslog.
> 
>    This particular message you mention, though, should almost never
>    come out, and never because of Joe Blow users, rather because
>    some awful thing happened when the sysadmin tried to load the
>    client-core (userspace connector). Wouldn't something important
>    have to be broken for that copy_from_user to fail?
> 
>    Anyhow, let me know if you think it might be OK to leave this one
>    in, else I'll take it out.

If the user passes a bogus pointer to the ioctl, then copy_from_user()
will fail and the program will segfault.  It's simple enough to run
valgrind or strace on the failing program and figure out why the program
segfaulted surely?

I don't know this code well enough, can regular users call the
ORANGEFS_DEV_CLIENT_STRING?  If so then they can trigger a DoS attack so
it's a considered a security violation.  If it's root only it doesn't
matter.

> 
> 3) Those weren't just tabs, those two lines were indented with all
>    spaces (oops), and thanks for taking out the cast if it is not needed.
> 
>    When there's too many arguments to type a whole function call
>    out on one line, though, I like to "stack" the arguments, it makes
>    it easier for me to see them... what do you think about that? Martin,
>    the other developer who does a lot of work on Orangefs, doesn't like
>    the way I put each argument on a line by itself, so maybe it is not
>    helpful to most people, or important...
> 

The way I changed it is the normal way but few people one feel strongly
about it.  I just did that because I removed the unneeded casting (and
forgot to mention it in the changelog).

> 4) The preserved error code will find its way back to vfs through
>    file_operations->unlocked_ioctl in the context of the pseudo device
>    through which the kernel module and Orangefs' userspace communicate. It
>    could end up being EINVAL or ENOMEM. Is that OK? When Al was getting
>    after me for returning the wrong error codes, he said we shouldn't
>    pick ones that seem reasonable to us, rather we should pick from the ones
>    that POSIX said would be valid ones. I try to pick valid ones now by
>    looking at the associated syscall's man page. There's no ENOMEM in
>    the ioctl(2) man page.

Preserving the error code is fine most of the time with a very few
exceptions.  -EIO was the wrong error code because that's for when you
can't read/write to the hardware because a drive fails or something.

regards,
dan carpenter

