From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 16 Nov 2014 11:14:46 +0000
Subject: Re: [PATCH 1/1] kernel-audit: Deletion of an unnecessary check before the function call "audit_log_e
Message-Id: <20141116111446.GA4956@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54687F1A.1010809@users.sourceforge.net>
 <20141116111023.GA4905@mwanda>
In-Reply-To: <20141116111023.GA4905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sun, Nov 16, 2014 at 02:10:23PM +0300, Dan Carpenter wrote:
> Please don't send these to trivial, because they can introduce bugs.

An example of a bug introduced is here:

https://lkml.org/lkml/2014/11/3/505

regards,
dan carpenter

