From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Nov 2014 09:03:38 +0000
Subject: Re: kernel-audit: Deletion of an unnecessary check before the function call "audit_log_end"
Message-Id: <20141124090337.GA7104@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54687F1A.1010809@users.sourceforge.net>
 <20141116111023.GA4905@mwanda> <20141116111446.GA4956@mwanda>
 <54688F15.9070703@users.sourceforge.net>
 <20141117073408.GC4905@mwanda>
 <5469B836.8030507@users.sourceforge.net>
 <alpine.DEB.2.02.1411231249310.2261@localhost6.localdomain6>
 <5471E010.2090105@users.sourceforge.net>
In-Reply-To: <5471E010.2090105@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sun, Nov 23, 2014 at 02:24:32PM +0100, SF Markus Elfring wrote:
> > Program analysis tools can also potentially exploit this information,
> 
> The published semantic patch scripts correspond to this desire.
> 

Sorry for that.

I have deleted the Smatch check for this so it no longer warns about:

	if (foo)
		kfree(foo);

regards,
dan carpenter

