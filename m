From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 20 Jul 2007 18:00:19 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <20070720180019.GJ14791@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org> <46A0F282.8070103@simon.arlott.org.uk>
In-Reply-To: <46A0F282.8070103@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 20, 2007 at 06:36:02PM +0100, Simon Arlott wrote:
> On 20/07/07 18:07, Matthew Wilcox wrote:
> > sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"
> > 
> > which will replace the leading tabs and spaces with one space.
> 
> ... isn't the space thing a workaround for a "diff -p" bug?

Yes.  I like not being affected by bugs.  If you prefer to be affected
by bugs, that's up to you.

> Labels should either not have any indent or be indented by tabs (since
> some code could presumably benefit from indenting labels).

Indenting labels implies that they might be scoped with the other code
at that level of indentation.  If you see code that looks like this:

	for () {
		switch () {
		case foo:
			while () {
				if () {
				} else {
 quux:
 				}
			}
		}
	}

you really want the quux standing out at you.  Otherwise you might think
this was a nice, easy to understand function.

> Mass
> replacing any labels run through Lindent with space prefixes would seem
> like a bad idea :/

We don't tend to mass-run code through Lindent.  This may or may not be
a bad thing, but the fact is that it just doesn't happen.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
