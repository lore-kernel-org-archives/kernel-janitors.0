From: Simon Arlott <simon@fire.lp0.eu>
Date: Fri, 20 Jul 2007 17:36:02 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <46A0F282.8070103@simon.arlott.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org>
In-Reply-To: <20070720170743.GF14791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/07/07 18:07, Matthew Wilcox wrote:
> Of course, we can't add this flag to Lindent until it's widely
> circulating amongst the distributions.  Perhaps we can add this to
> Lindent in the meantime:
> 
> sed -i -e 's/^\t*      \(\w*:\)/ \1/' "$@"
> 
> which will replace the leading tabs and spaces with one space.
> It should leave case labels unmolested, as they should be indented with
> tabs, not 6 spaces.

... isn't the space thing a workaround for a "diff -p" bug?

Labels should either not have any indent or be indented by tabs (since
some code could presumably benefit from indenting labels). Mass
replacing any labels run through Lindent with space prefixes would seem
like a bad idea :/


(From original reply)
It has a habit of leaving/creating "^\t+ +" too, and that "\t\t/*
comment */$" oddity, I couldn't see any options in the man page to fix
those...

-- 
Simon Arlott
