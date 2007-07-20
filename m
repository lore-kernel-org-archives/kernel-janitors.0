From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 20 Jul 2007 17:07:43 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <20070720170743.GF14791@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk>
In-Reply-To: <4699EEA9.6070709@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 15, 2007 at 10:53:45AM +0100, Simon Arlott wrote:
> Do people ever check what Lindent does?
[...]
> > -out1:
> > +      out1:
> 
> NAK: A perfectly valid non-indented label is now indented by 6 spaces.

I tracked down why indent does this.  It's actually hard-coded to indent
by 2 fewer columns than the current code indentation.  I've patched it
to allow specifying either an absolute column, or a column relative to
the current indentation level.

Patch here:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bugC3956

Of course, we can't add this flag to Lindent until it's widely
circulating amongst the distributions.  Perhaps we can add this to
Lindent in the meantime:

sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"

which will replace the leading tabs and spaces with one space.
It should leave case labels unmolested, as they should be indented with
tabs, not 6 spaces.

Any regexp ninjas want to have a go at something better?

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
