From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Jan 2015 08:07:36 +0000
Subject: Re: [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_client_clunk"
Message-Id: <20150106080736.GB14982@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54A01326.3050306@users.sourceforge.net>
 <54A06AB9.4020505@users.sourceforge.net>
 <20150105112206.GC15033@mwanda>
 <54AB02F3.5020308@users.sourceforge.net>
In-Reply-To: <54AB02F3.5020308@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Jan 05, 2015 at 10:32:35PM +0100, SF Markus Elfring wrote:
> > I assume this patch adds a bug.  You have tried to introduce several of these
> > kinds of bugs.
> 
> Do any other contributors want to reject my update suggestions
> around software components for "fs/9p"?

Some of the 9p patches actually seem like bug fixes so I like those
ones.  It would be better if the bug fixes had a correct changelog, of
course.

regards,
dan carpenter

