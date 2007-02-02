From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 02 Feb 2007 22:14:19 +0000
Subject: Re: [KJ] the current situation for the KJ wiki
Message-Id: <20070202221419.GB5549@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070131135158.7c4fdffc.rdunlap@xenotime.net>
In-Reply-To: <20070131135158.7c4fdffc.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 01, 2007 at 09:23:26AM -0800, Randy Dunlap wrote:
> On Thu, 1 Feb 2007 04:16:39 -0500 (EST) Robert P. J. Day wrote:
> 
> > On Thu, 1 Feb 2007, Jaco Kroon wrote:
> > 
> > > Correct, but in many cases OCR software can decipher them, and when
> > > that isn't simple enough a human spammer can solve them at around a
> > > captcha every 5 seconds, stil allowing a spammer to do about 20
> > > posts per minute, permitting he's willing to sit there the whole day
> > > and solve captchas.  Or man-in-the-middle if he can construct a
> > > "popular" site on which to represent the captchas to other people to
> > > solve.
> > 
> > what about making the wiki *not* world-writable, in the sense of not
> > even allowing arbitrary people to register for accounts before they
> > start editing?
> > 
> > i realize that (sort of) defeats the purpose of a wiki but, really,
> > how many people plan on doing editing anyway?  the current ToDo list
> > is *totally* immutable.  perhaps we can find a middle ground where, if
> > you have a *legitimate* need to edit the wiki -- perhaps because
> > you're taking on a project -- then someone with the authority will
> > arrange for you to get an account.
> 
> You are supposed to be able to edit the wiki at
> http://kernelnewbies.org/KernelJanitors/Todo
> just by registering there as a user...
> Does that not work?
> ... yes, just register and login, then edit away.

Yes, this should work.

Answering original question: world-writeable wiki (after resigtration)
or HTML on CVS. Nicely laid out HTML with em-dashes, hyperlinks and
monotype font.


It seems that the only pro wikis in general have is that users don't
have to ping admin about every change. Once that is taken out... What
is left? Yet another braindamaged ML... Sorry, did you notice that

	{{{
		int foo;
	}}}

generates the following box

	+-----------------------+
	|	int foo;	|
	|			|
	+-----------------------+

So, if you want to make it exactly one line in heigth you have to
write original "code" as

	{{{
		int foo;}}}

Amazing, isn't it?

I'm again, sorry, but HTML isn't hard. If you only need hyperlinks,
lists, monotype font, normal font, sometimes red color, it's very
easy.

How exactly different H1, H2, ..., H6 tags are from

	------------
	======
	~~~~~~~~~~~~
	::::::::::::
	\\\\\\\\\\\\
	############

	Alexey "?" Dobriyan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
