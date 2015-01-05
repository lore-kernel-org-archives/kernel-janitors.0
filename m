From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Jan 2015 11:22:06 +0000
Subject: Re: [PATCH 1/8] fs/9p: Deletion of unnecessary checks before the function call "p9_client_clunk"
Message-Id: <20150105112206.GC15033@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54A01326.3050306@users.sourceforge.net>
 <54A06AB9.4020505@users.sourceforge.net>
In-Reply-To: <54A06AB9.4020505@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>, v9fs-developer@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Dec 28, 2014 at 09:40:25PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 27 Dec 2014 09:34:39 +0100
> 
> The p9_client_clunk() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 

Not true.  You are not allowed to call p9_client_clunk(NULL).  I assume
this patch adds a bug.  You have tried to introduce several of these
kinds of bugs.  You are not careful enough.

regards,
dan carpenter

