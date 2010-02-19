From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Fri, 19 Feb 2010 13:09:11 +0000
Subject: Re: [patch] oxygen: clean up. make precedence explicit
Message-Id: <1266584951.31443.15.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B7E4BD1.3040106@ladisch.de>
In-Reply-To: <4B7E4BD1.3040106@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fre, 2010-02-19 at 14:29 +0300, Dan Carpenter wrote:
> On Fri, Feb 19, 2010 at 11:33:30AM +0100, Bernd Petrovitsch wrote:
[...]
> Basically often when people write:
> 	if (!foo = bar) { ...
> 
> What they mean is:
> 	if (!(foo = bar)) { ...
Ugh. The IMHO better way is 
	if (foo != bar) { ...
Or do we need
#define unless(cond) if (!(cond))
(as in perl)?

> But if they really do mean the original code they could just write 
> this so it's clear to everyone: 
> 	if ((!foo) = bar) { ...
Well, since we have a boolean/0-or-1 on the left side, there actually
shouldn't be too much cases to compare in that way to another value.

> To me it's like "=" vs "=".  Of course, every programmer knows the 
> what the difference is but it helps to have gcc warn about adding the 
> extra parenthesis.  Maybe I suck, but it definitely has helped me in 
> then past.
At most your coding style sucks. We have all our syntax quirks ....
IMHO it is extremely uncommon style (which adds to "doesn't buy that
much" for me).

> I don't have strong feelings about this btw.  The original code in
> oxygyn_mixer works fine.  I just was making some changes to smatch and
> that was a new warning today.  There is no method to my madness.
If there is method to madness, would it actually be madness? ;-)

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

