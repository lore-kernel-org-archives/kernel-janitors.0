From: Wang YanQing <udknight@gmail.com>
Date: Sun, 03 May 2020 11:45:57 +0000
Subject: Re: [PATCH v4] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <20200503114557.GA10332@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200502185421.GB9082@udknight>
 <6a3a6f8d-e8be-0002-780d-1991f6152c8f@web.de>
In-Reply-To: <6a3a6f8d-e8be-0002-780d-1991f6152c8f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

On Sat, May 02, 2020 at 09:40:24PM +0200, Markus Elfring wrote:
> 
> 
> > +				$diagnostics .= "Missing a pair of parentheses '()' or a pair of double quotation marks (\"\").\n";
> 
> Can such a message trigger any more thoughts and development ideas?

No, I don't think so. '(" ... ")' is the minimum interface between analyser
(checkpatch) and commit id description (normal commit id and 'Fixes:' tag)
about the title, it is very difficult if not impossible to guess the title
boundary and whether it is the *REAL* title that folllow the SHA1 without
this precondition, and it is more difficult to do it when we need to support
title which across lines in the normal commit id description.

At last I really doubt the benefit it brings deserves the complexity and the
current diagnostics info is enough clear for most situation.

Thanks.
