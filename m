From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Jan 2004 03:34:29 +0000
Subject: Re: [Kernel-janitors] TODO suggestions.
Message-Id: <20040111193429.50c221da.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073548328.2024.27.camel@telecentrolivre>
In-Reply-To: <1073548328.2024.27.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 08 Jan 2004 05:52:08 -0200 Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> wrote:

| 
| Hi all,
| 
|  Is this still valid ?
| ------
| 
| "From: Andrew Morton <andrewm at uow dot edu dot au> 
| Here - have about 300 bugs:
| 
| http://www.uwsg.iu.edu/hypermail/linux/kernel/0005.3/0269.html
| 
| A lot of the timer deletion races are hard to fix because of
| the deadlock problem."
| ----

I really have no idea...

| "From: Jeff Garzik <jgarzik at mandrakesoft dot com>
| 
| The string form
| 
| 	[const] char *foo = "blah";
| 
| creates two variables in the final assembly output, a static string, and
| a char pointer to the static string.  The alternate string form
| 
| 	[const] char foo[] = "blah";
| 
| is better because it declares a single variable.
| 
| For variables marked __initdata, the "*foo" form causes only the
| pointer, not the string itself, to be dropped from the kernel image,
| which is a bug.  Using the "foo[]" form with regular 'ole local
| variables also makes the assembly shorter.
| 
| Look at the diff between include/linux/etherdevice.h in pre7 versus
| pre8.  The assembly for the pre8 version is ~10 lines shorter, with 6 of
| those removed lines being the string constant stored separately.
| Maybe this should go into CodingStyle?"

I guess this isn't DONE yet, since Max has some more changes in this area...

However, I did update the KJ TODO and DONE files.

--
~Randy
MOTD:  Always include version info.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
