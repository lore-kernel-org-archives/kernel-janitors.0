From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Oct 2014 13:17:39 +0000
Subject: Re: [patch] staging: rtl8723au: incorrect use of ether_addr_copy()
Message-Id: <20141008131739.GD26918@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141008104014.GA23096@mwanda>
 <1412771171.3438.25.camel@joe-AO725>
 <20141008124631.GC26918@mwanda>
 <alpine.DEB.2.10.1410081449160.2441@hadrien>
In-Reply-To: <alpine.DEB.2.10.1410081449160.2441@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Jes Sorensen <Jes.Sorensen@redhat.com>, linux-wireless@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Larry Finger <Larry.Finger@lwfinger.net>

On Wed, Oct 08, 2014 at 02:50:50PM +0200, Julia Lawall wrote:
> Couldn't you just use your favorite matching tool, collect the file names,
> compile them, run pahole, and process the output in some way?  It doesn't
> give a complete analysis (you don't find all problems), but if you find a
> problem it is a real problem.

Well...  You would be better off using Smatch than pahole.  And
obviously I did try something like this, but it's fairly tricky.

regards,
dan carpenter

