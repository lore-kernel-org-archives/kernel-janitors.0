From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Wed, 27 Jan 2010 14:44:44 +0000
Subject: Re: bug list: assigning negative values to unsigned variables
Message-Id: <20100127144444.GM19799@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100127104011.GA24796@bicker> <Pine.LNX.4.64.1001271155430.20256@ask.diku.dk> <1264590586.9749.2.camel@localhost> <Pine.LNX.4.64.1001271329460.20256@ask.diku.dk> <1264601569.10795.131.camel@localhost>
In-Reply-To: <1264601569.10795.131.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc: Julia Lawall <julia@diku.dk>, Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 27, 2010 at 03:12:49PM +0100, Bernd Petrovitsch wrote:
> On Mit, 2010-01-27 at 13:30 +0100, Julia Lawall wrote:
> > On Wed, 27 Jan 2010, Bernd Petrovitsch wrote:
> > > On Mit, 2010-01-27 at 11:57 +0100, Julia Lawall wrote:
> > > > On Wed, 27 Jan 2010, Dan Carpenter wrote:
> > > > 
> > > > > Fixing the places which assign negative values to unsigned variables is a good janitor task.
> > > > 
> > > > I had the impression that assignment to -1 was done sometimes as a 
> > > > portable way to initialize the variable to 0xffff (for any number of f's).  
> Hmm, perhaps some experienced language lawyer can comment on the
> "portable".

Doesn't take a lawyer; conversion to unsigned types *IS* portable and defined
as arithmetics modulo 2^{width}.  In particular, for any unsigned type T you
are going to have the same results from (T)-1 and ~(T)0 (and (T)-1L, etc.).
The value being converted is interpreted as an integer (i.e. the element of
$\Bbb Z$) and then taken modulo 2^{width}, regardless of the type it had
come from.  So -1 is just fine and will result in 0xff....f of the right
width.

It's conversion to signed that is a mess if the value you are converting isn't
already in range representable by the type you are converting to.

Whether a specific example of conversion of negative to unsigned is a good
idea stylistically is a different question, of course, but that should be
taken on case-to-case basis.
