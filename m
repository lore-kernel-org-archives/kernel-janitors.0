From: Mike Marshall <hubcap@omnibond.com>
Date: Fri, 16 Dec 2016 20:35:34 +0000
Subject: Re: [patch] orangefs: cleanup orangefs_debugfs_new_client_string()
Message-Id: <CAOg9mSQqO1ABRQ==0hoorBDZGt9yO0Byh8c3k8h1M9X5YPXq3A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161216104524.GA2637@elgon.mountain>
In-Reply-To: <20161216104524.GA2637@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>

Hi Dan...

Your patch applies, and compiles, and works. Thanks!

1) Al Viro tried to get me to fix all the places where I returned wrong
   error codes before we went upstream, I guess I slipped some by him <g>...

2) Some system administrators have admonished me because
   of a place where I put annoying messages into the ring
   buffer when a particular error occurs during op processing.
   I liked seeing it during development, but on a busy production cluster
   filled with people hitting CTRL-C and whatever else people whimsically
   do, there were thousands of "No one's waiting for tag #such-and-such"
   messages in dmesg and syslog.

   This particular message you mention, though, should almost never
   come out, and never because of Joe Blow users, rather because
   some awful thing happened when the sysadmin tried to load the
   client-core (userspace connector). Wouldn't something important
   have to be broken for that copy_from_user to fail?

   Anyhow, let me know if you think it might be OK to leave this one
   in, else I'll take it out.

3) Those weren't just tabs, those two lines were indented with all
   spaces (oops), and thanks for taking out the cast if it is not needed.

   When there's too many arguments to type a whole function call
   out on one line, though, I like to "stack" the arguments, it makes
   it easier for me to see them... what do you think about that? Martin,
   the other developer who does a lot of work on Orangefs, doesn't like
   the way I put each argument on a line by itself, so maybe it is not
   helpful to most people, or important...

4) The preserved error code will find its way back to vfs through
   file_operations->unlocked_ioctl in the context of the pseudo device
   through which the kernel module and Orangefs' userspace communicate. It
   could end up being EINVAL or ENOMEM. Is that OK? When Al was getting
   after me for returning the wrong error codes, he said we shouldn't
   pick ones that seem reasonable to us, rather we should pick from the ones
   that POSIX said would be valid ones. I try to pick valid ones now by
   looking at the associated syscall's man page. There's no ENOMEM in
   the ioctl(2) man page.

5) OK

On Fri, Dec 16, 2016 at 5:45 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Several small things in this function:
> 1) If copy to user fails we should return -EFAULT not -EIO
> 2) Don't print an error message, just fail.  It's annoying to let the
>    users fill up dmesg and especially for something small like this.
> 3) Remove a stray tab.
> 4) Preserve the error code if orangefs_prepare_debugfs_help_string()
>    fails.
> 5) "return 0;" is more explicit and clear than "return ret;".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
> index 27e75cf28b3a..409fa6b0d339 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -966,15 +966,9 @@ int orangefs_debugfs_new_client_string(void __user *arg)
>  {
>         int ret;
>
> -       ret = copy_from_user(&client_debug_array_string,
> -                                     (void __user *)arg,
> -                                     ORANGEFS_MAX_DEBUG_STRING_LEN);
> -
> -       if (ret != 0) {
> -               pr_info("%s: CLIENT_STRING: copy_from_user failed\n",
> -                       __func__);
> -               return -EIO;
> -       }
> +       if (copy_from_user(&client_debug_array_string, arg,
> +                          ORANGEFS_MAX_DEBUG_STRING_LEN))
> +               return -EFAULT;
>
>         /*
>          * The real client-core makes an effort to ensure
> @@ -988,17 +982,18 @@ int orangefs_debugfs_new_client_string(void __user *arg)
>          */
>         client_debug_array_string[ORANGEFS_MAX_DEBUG_STRING_LEN - 1] >                 '\0';
> -
> +
>         pr_info("%s: client debug array string has been received.\n",
>                 __func__);
>
>         if (!help_string_initialized) {
>
>                 /* Build a proper debug help string. */
> -               if (orangefs_prepare_debugfs_help_string(0)) {
> +               ret = orangefs_prepare_debugfs_help_string(0);
> +               if (ret) {
>                         gossip_err("%s: no debug help string \n",
>                                    __func__);
> -                       return -EIO;
> +                       return ret;
>                 }
>
>         }
> @@ -1011,7 +1006,7 @@ int orangefs_debugfs_new_client_string(void __user *arg)
>
>         help_string_initialized++;
>
> -       return ret;
> +       return 0;
>  }
>
>  int orangefs_debugfs_new_debug(void __user *arg)
