From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 11 Dec 2015 12:14:51 +0000
Subject: Re: Source code review around jump label usage
Message-Id: <alpine.DEB.2.10.1512111312330.2494@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, "Derek M. Jones" <derek@knosof.co.uk>

> Do any of these numbers indicate update candidates which correspond to the
> "one error jump label bug" symptom that is mentioned in the Linux coding
> style documentation?

I don't think that numbers could indicate that.  The point of that is a
single label followed by a bunch of ifs, or by calls to functions that
perform tests on input validity.  That is, it is the content of the code
that causes the problem, not its size.  Dan also discourages the use of
labels like out, that don't indicate anything about anything, or
kmalloc_err, which don't indicate anything about what happens at the label
target.

julia
