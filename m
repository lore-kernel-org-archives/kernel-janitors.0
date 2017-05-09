From: Joe Perches <joe@perches.com>
Date: Tue, 09 May 2017 21:16:52 +0000
Subject: Re: checkpatch: Adjust regular expressions in $logFunctions
Message-Id: <1494364612.4564.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2178c87-9229-978d-c94e-6c124755c440@users.sourceforge.net>
         <1494363154.20782.7.camel@perches.com>
         <bc5feee3-77d5-1850-cab0-eb37f128eaae@users.sourceforge.net>
In-Reply-To: <bc5feee3-77d5-1850-cab0-eb37f128eaae@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Andy Whitcroft <apw@canonical.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-05-09 at 23:01 +0200, SF Markus Elfring wrote:
> > Perl is odd enough already adding more non-capture groups
> > when the arguments are clearly specified is harder to read.
> 
> How do you think about to reformat the affected alternations?
> Will it become appropriate to give each element a separate line there?

I have no interest in changing checkpatch for no value.

_maybe_, breaking up the file into separate tests in
multiple files _could_ be useful.

