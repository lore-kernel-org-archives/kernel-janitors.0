From: "Randy Dunlap" <rdunlap@xenotime.net>
Date: Tue, 05 Oct 2010 12:55:15 +0000
Subject: Re: [PATCH] kernel: fix spelling and grammar errors within the
Message-Id: <33448.174.131.17.219.1286283315.squirrel@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286263954-13016-1-git-send-email-csciian@gmail.com>
In-Reply-To: <1286263954-13016-1-git-send-email-csciian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Tue, October 5, 2010 12:32 am, Ian Reith wrote:
> Change user mode -> usermode for consistency and which -> that for
> proper usage of a restrictive clause; add "called" to a comment and make
> "F" lowercase in same comment along with fixing the column
> width; add a few missing periods; remove unneeded comma and properly
> punctuate parenthetical.
>
> Signed-off-by: Ian Reith <csciian@gmail.com>

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
> kernel/kmod.c |   28 ++++++++++++++-------------- 1 files changed, 14
> insertions(+), 14 deletions(-)
>
> diff --git a/kernel/kmod.c b/kernel/kmod.c index 9cd0591..6a393c8 100644
> --- a/kernel/kmod.c
> +++ b/kernel/kmod.c
> @@ -56,7 +56,7 @@ char modprobe_path[KMOD_PATH_LEN] = "/sbin/modprobe";
> * @fmt: printf style format string for the name of the module
> * @...: arguments as specified in the format string
> *
> - * Load a module using the user mode module loader. The function returns
> + * Load a module using the usermode module loader. The function returns
> * zero on success or a negative errno code on failure. Note that a
> * successful module load does not mean the module did not then unload
> * and exit on an error of its own. Callers must check that the service
> @@ -127,7 +127,7 @@ EXPORT_SYMBOL(__request_module);
> #endif /* CONFIG_MODULES */
>
>
> /*
> - * This is the task which runs the usermode application
> + * This is the task that runs the usermode application.
> */
> static int ____call_usermodehelper(void *data) {
> @@ -211,7 +211,7 @@ static int wait_for_helper(void *data)
> return 0; }
>
>
> -/* This is run by khelper thread  */
> +/* This is run by the khelper thread.  */
> static void __call_usermodehelper(struct work_struct *work) {
> struct subprocess_info *sub_info = @@ -220,7 +220,7 @@ static void
> __call_usermodehelper(struct work_struct *work)
> pid_t pid;
>
> /* CLONE_VFORK: wait until the usermode helper has execve'd
> -	 * successfully We need the data structures to stay around
> +	 * successfully. We need the data structures to stay around
> * until that is done.  */
> if (wait = UMH_WAIT_PROC) pid = kernel_thread(wait_for_helper,
sub_info, @@
> -264,7 +264,7 @@ static DECLARE_WAIT_QUEUE_HEAD(running_helpers_waitq);
>
>
> /*
> * Time to wait for running_helpers to become zero before the setting of
> - * usermodehelper_disabled in usermodehelper_pm_callback() fails
> + * usermodehelper_disabled in usermodehelper_pm_callback() fails.
> */
> #define RUNNING_HELPERS_TIMEOUT	(5 * HZ)
>
>
> @@ -356,12 +356,12 @@ EXPORT_SYMBOL(call_usermodehelper_setup);
> *
> * The init function is used to customize the helper process prior to
> * exec.  A non-zero return code causes the process to error out, exit,
> - * and return the failure to the calling process
> + * and return the failure to the calling process.
> *
> - * The cleanup function is just before ethe subprocess_info is about to
> - * be freed.  This can be used for freeing the argv and envp.  The
> - * Function must be runnable in either a process context or the
> - * context in which call_usermodehelper_exec is called.
> + * The cleanup function is called just before the subprocess_info is
> + * about to be freed.  This can be used for freeing the argv and envp.
> + * The function must be runnable in either a process context or the
> + * context that call_usermodehelper_exec is called.
> */
> void call_usermodehelper_setfns(struct subprocess_info *info, int
> (*init)(struct subprocess_info *info),
> @@ -376,15 +376,15 @@ EXPORT_SYMBOL(call_usermodehelper_setfns);
>
>
> /**
> * call_usermodehelper_exec - start a usermode application
> - * @sub_info: information about the subprocessa
> + * @sub_info: information about the subprocess
> * @wait: wait for the application to finish and return status.
> - *        when -1 don't wait at all, but you get no useful error back
> when + *        When -1 don't wait at all, but you get no useful error
> back when *        the program couldn't be exec'ed. This makes it safe to
> call *        from interrupt context.
> *
> * Runs a user-space application.  The application is started
> - * asynchronously if wait is not set, and runs as a child of keventd.
> - * (ie. it runs with full root capabilities).
> + * asynchronously if wait is not set and runs as a child of keventd
> + * (i.e., it runs with full root capabilities).
> */
> int call_usermodehelper_exec(struct subprocess_info *sub_info, enum
> umh_wait wait) --



-- 
~Randy

