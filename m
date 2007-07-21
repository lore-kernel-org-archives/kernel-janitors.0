From: Oleg Verych <olecom@flower.upol.cz>
Date: Sat, 21 Jul 2007 04:32:56 +0000
Subject: Fixing lables after GNU indent (Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/Cod
Message-Id: <20070721043256.GH475@flower.upol.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org> <E1IBzQw-0000Im-55@flower> <20070720205418.GK14791@parisc-linux.org>
In-Reply-To: <20070720205418.GK14791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Simon Arlott <simon@fire.lp0.eu>, Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[]
> > > sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"
> > >
> > > which will replace the leading tabs and spaces with one space.
> > > It should leave case labels unmolested, as they should be indented with
> > > tabs, not 6 spaces.
> > >
> > > Any regexp ninjas want to have a go at something better?
> > 
> > I'm the one. Trying to write portable, optimized and easy to
> > understand scripts [0].
> > 
> > Please, describe more what must be done, and i will do it. Case labels
> > are handled very strangely in you example.
> 
> OK.  indent will indent labels to a column number that's a multiple of
> 8, plus 6.  So it may start in column 6, 14, 20, 28, etc.  I'm not quite
> sure what the definition of a label is; I had it as \w*: up there, but I
> don't know if that would match the _.  The point is to *not* handle case
> labels, only goto labels.

t=`printf '\t'`
sed -i "s_^\($t*\)  *\([^:]*:\)_\1\2_" "$@"
                                  ^-_
I'm not sure about leaving one space `here, otherwise it removes
spaces between (supposedly right indented) line start, i.e. nothing or
tab(s), and a label, i.e. `label_name:' without space before colon;
`label_name' here actually not a colon, let's leave that kind of
breakage to compiler.

The variable $t is used for readability of the regex and because POSIX
BREs leave undefined characters after a backslash, POSIX sed defines
only \n as a new line.

--
-o--=O`C
 #oo'L O
<___=E M
