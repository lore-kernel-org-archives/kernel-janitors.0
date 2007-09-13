From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 13 Sep 2007 18:12:34 +0000
Subject: Re: [PATCH][RFC] Drop the "static __initdata" from tmp_cmdline in
Message-Id: <Pine.LNX.4.64.0709131406050.5579@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 13 Sep 2007, Thomas Petazzoni wrote:

> Hi,
>
> Robert P. J. Day wrote:
>
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -482,7 +482,7 @@ static int __init do_early_param(char *param, char *val)
> >  void __init parse_early_param(void)
> >  {
> >  	static __initdata int done = 0;
> > -	static __initdata char tmp_cmdline[COMMAND_LINE_SIZE];
> > +	char tmp_cmdline[COMMAND_LINE_SIZE];
>
> As I've said in an answer to an e-mail from you on the kernelnewbies
> mailing list, this change is going to allocate 2k on the stack,
> which is quite big compared to the overall stack size. If you use 8k
> stacks, it may still work, but with 4k stacks, it eats half of the
> stack, leaving only 2k for the rest of the code to execute, which
> may not be enough. I think that why this buffer is static.

  as a (sort of) related followup to the above, note that having
dropped the "static __initdata" would have had a nasty effect on any
__setup or early_param-registered setup functions that assumed that
the data at the address they were passed was going to persist, or
assumed that they could write back to that address.

  but technically, that's not disallowed.  look at the layout of the
relevant structure:

struct obs_kernel_param {
        const char *str;
        int (*setup_func)(char *);
        int early;
};

  note that the setup_func accepts "char *" as opposed to "const char
*".  any legitimate reason for that?  are there, in fact, any of those
setup functions anywhere in the tree that try to modify the data back
at that passed address?  i would have assumed not, but i haven't
looked closely enough.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
