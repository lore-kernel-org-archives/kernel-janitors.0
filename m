From: Joe Perches <joe@perches.com>
Date: Mon, 08 Dec 2014 09:18:29 +0000
Subject: Re: [PATCH 6/20] TTY: fix misspelling of current function in string
Message-Id: <1418030309.31745.37.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1417980062-25151-7-git-send-email-Julia.Lawall@lip6.fr>
	 <548565FC.1020908@suse.cz>
In-Reply-To: <548565FC.1020908@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jslaby@suse.cz>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org

On Mon, 2014-12-08 at 09:49 +0100, Jiri Slaby wrote:
> On 12/07/2014, 08:20 PM, Julia Lawall wrote:
> > Replace the last argument of serial_paranoia_check by the actual function
> > name.
[]
> > diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
[]
> > @@ -931,7 +931,7 @@ static void rs_send_xchar(struct tty_struct *tty, char ch)
> >  	struct serial_state *info = tty->driver_data;
> >          unsigned long flags;
> >  
> > -	if (serial_paranoia_check(info, tty->name, "rs_send_char"))
> > +	if (serial_paranoia_check(info, tty->name, "rs_send_xchar"))
> 
> I wonder, why not to use __func__ here too?

Nearly identical functions are used in amiserial and cyclades.
Disabled in amiserial, enabled in cyclades.

It might be better to add it to some file like
drivers/tty/debug_utils.h

It'd probably be better to change:

static inline int serial_paranoia_check(struct serial_state *info,
					char *name, const char *routine)
{
#ifdef SERIAL_PARANOIA_CHECK
	static const char *badmagic 		"Warning: bad magic number for serial struct (%s) in %s\n";
	static const char *badinfo 		"Warning: null async_struct for (%s) in %s\n";

	if (!info) {
		printk(badinfo, name, routine);
		return 1;
	}
	if (info->magic != SERIAL_MAGIC) {
		printk(badmagic, name, routine);
		return 1;
	}
#endif
	return 0;
}

to something like:

static inline int serial_paranoia_check(struct serial_state *info, char *name)
{
#ifdef SERIAL_PARANOIA_CHECK
	if (!info) {
		pr_warn("async_struct for (%s) is NULL in %pf\n",
			name, __builtin_return_address(0));
		return 1;
	}
	if (info->magic != SERIAL_MAGIC) {
		pr_warn("serial struct (%s) has bad magic number in %pf\n",
			name, __builtin_return_address(0));
		return 1;
	}
#endif
	return 0;
}

and remove all the function names from the callers.


