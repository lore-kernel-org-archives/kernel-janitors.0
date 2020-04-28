From: Joe Perches <joe@perches.com>
Date: Tue, 28 Apr 2020 16:10:44 +0000
Subject: Re: [PATCH v3] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <b452dc29fb553fa5993b90131dcdbc04ed87532e.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428020223.GA28074@udknight>
In-Reply-To: <20200428020223.GA28074@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang YanQing <udknight@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andy Whitcroft <apw@canonical.com>, Markus.Elfring@web.de, mcroce@redhat.com

On Tue, 2020-04-28 at 10:02 +0800, Wang YanQing wrote:
> According to submitting-patches.rst, 'Fixes:' tag has a little
> stricter condition about the one line summary:
> ...
> Do not split the tag across multiple
> lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
> parsing scripts
> ...
> 
> And there is no 'Fixes:' tag format checker in checkpatch to check
> the commit id length too, so let's add dedicated checker to check
> these conditions for 'Fixes:' tag.

There's no need to duplicate functionality like this.
Put this additional Fixes: logic into the existing block.

(and don't take advise from Markus too seriously when it
comes to English grammar or wording.  He is not an arbiter
of taste for this code)
