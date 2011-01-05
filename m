From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Wed, 05 Jan 2011 17:38:07 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <m3fwt7i740.fsf@intrepid.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker>
	<20110104163836.GA30317@fieldses.org>
	<20110104164414.GX5875@const.bordeaux.inria.fr>
	<1294160834.6617.51.camel@Joe-Laptop>
In-Reply-To: <1294160834.6617.51.camel@Joe-Laptop> (Joe Perches's message of
	"Tue, 04 Jan 2011 09:07:14 -0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, "J. Bruce Fields" <bfields@fieldses.org>, Dan Carpenter <error27@gmail.com>, Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Joe Perches <joe@perches.com> writes:

> As do I, but perhaps coding style in a project like this
> shouldn't be personal but collective.

I think there is nothing like a collective style.
What you can eventually achieve is a style everybody hates.

> The trailing style outnumbers the leading style ~ 5:1.
>
> $ grep -rP --include=*.[ch] "(\|\||&&)[ \t]*$" * | wc -l
> 39890
> $ grep -rP --include=*.[ch] "^[ \t]*(\|\||&&)" * | wc -l
> 8244
>
> If you take out drivers/staging, trailing is used ~ 6:1.
>
> I think that high enough to be declared the preferred style.

This is a very weak reason (if any at all) to do so. Increasing e.g.
readability of the code would be a good reason, but statistics?

Maybe: Microsoft Windows outnumbers Linux X:1, so it should be declared
the "preferred" system (= the only allowed, as with CodingStyle and
checkpatch "errors").

Or: cars outnumber trucks X:1, declare the trucks illegal.
Coffee drinkers outnumber tee drinkers, kill the later.


Yes, we need some basic common style (tabs length, unless/until we can
use any tab length), K&R (or other) parentheses, void *var instead of
void* var (void* var1, var2 bugs), (no) spaces etc. Anything less make
the code unreadable or less readable. We should stop dictating the
details when the benefits end, and they end pretty fast.
-- 
Krzysztof Halasa
