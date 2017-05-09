From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 May 2017 21:01:29 +0000
Subject: Re: checkpatch: Adjust regular expressions in $logFunctions
Message-Id: <bc5feee3-77d5-1850-cab0-eb37f128eaae@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2178c87-9229-978d-c94e-6c124755c440@users.sourceforge.net>
 <1494363154.20782.7.camel@perches.com>
In-Reply-To: <1494363154.20782.7.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Perl is odd enough already adding more non-capture groups
> when the arguments are clearly specified is harder to read.

How do you think about to reformat the affected alternations?
Will it become appropriate to give each element a separate line there?

Regards,
Markus
