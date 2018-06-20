From: Jason Wessel <jason.wessel@windriver.com>
Date: Wed, 20 Jun 2018 20:24:19 +0000
Subject: Re: [PATCH] kdb: Off by one bugs in kdbgetaddrarg()
Message-Id: <01e20f68-5a8c-d65d-170f-a577d6d52088@windriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620110852.oavyzqhsos5fazma@kili.mountain>
In-Reply-To: <20180620110852.oavyzqhsos5fazma@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/20/2018 06:08 AM, Dan Carpenter wrote:
> If "*nextarg = argc" then we end up reading beyond the end of the
> argv[] array.
> 
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 2ddfce8f1e8f..214d09345056 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -522,7 +522,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
>   	 *  $environment-variable
>   	 */
>   
> -	if (*nextarg > argc)
> +	if (*nextarg >= argc)
>   		return KDB_ARGCOUNT;


Did you happen to test what happened if you made this change?

I hadn't looked at this code since it was initially merged, nor did I write it.  It doesn't make good use of the way argc is described.  In fact the code does some monumentally stupid things like:

		KDB_STATE_SET(CMD);
		result = (*tp->cmd_func)(argc-1, (const char **)argv);
		if (result && ignore_errors && result > KDB_CMD_GO)

So argc isn't what you think it is where you are trying to change it, and it will cease working correctly, so we are not going to merge this patch.  It appears it is actually an index for what arguments come after the command.

A quick example:


[0]kdb> md main

And now if we happen to debug the kernel with an ICE, we can see:

Breakpoint 2 at 0xffffffff810e41cd: file /space/jw/git/kgdb/linux-2.6-kgdb/kernel/debug/kdb/kdb_main.c, line 525.
(gdb) list
520		 *  symbol | numeric-address [+/- numeric-offset]
521		 *  %register
522		 *  $environment-variable
523		 */
524	
525		if (*nextarg > argc)
526			return KDB_ARGCOUNT;
527	
528		symname = (char *)argv[*nextarg];
529	
(gdb) p *nextarg
$14 = 1
(gdb) p argc
$15 = 1
(gdb) p argv[0]
$16 = 0xffffffff825a6880 <cbuf> "md"
(gdb) p argv[1]
$17 = 0xffffffff825a6883 <cbuf+3> "main"

I don't know if some kind of tool is reporting we have a problem here, but the fix you suggested is not going to work, unless we also change the semantics on how the variable is passed in and used elsewhere.


Cheers,
Jason.


>   
>   	symname = (char *)argv[*nextarg];
> @@ -574,7 +574,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
>   	if (offset && name && *name)
>   		*offset = addr - symtab.sym_start;
>   
> -	if ((*nextarg > argc)
> +	if ((*nextarg >= argc)
>   	 && (symbol = '\0'))
>   		return 0;
>   
> @@ -599,7 +599,7 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
>   	/*
>   	 * Now there must be an offset!
>   	 */
> -	if ((*nextarg > argc)
> +	if ((*nextarg >= argc)
>   	 && (symbol = '\0')) {
>   		return KDB_INVADDRFMT;
>   	}
> 

