From: Joe Perches <joe@perches.com>
Date: Tue, 09 May 2017 20:52:34 +0000
Subject: Re: [PATCH] checkpatch: Adjust regular expressions in $logFunctions
Message-Id: <1494363154.20782.7.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2178c87-9229-978d-c94e-6c124755c440@users.sourceforge.net>
In-Reply-To: <a2178c87-9229-978d-c94e-6c124755c440@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Andy Whitcroft <apw@canonical.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-05-09 at 21:00 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 9 May 2017 20:40:51 +0200
> 
> * Two alternations contained an empty element. Use the question mark
>   metacharacter instead to express optional items in the search pattern.
> 
> * Some alternation elements shared a common prefix (like an underscore).
>   Improve the specification of this detail by more non-capturing groups.

No thanks.   Perl is odd enough already adding more non-capture
groups when the arguments are clearly specified is harder to read.

