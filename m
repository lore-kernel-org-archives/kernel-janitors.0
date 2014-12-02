From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Dec 2014 18:35:09 +0000
Subject: Re: net-PA Semi: Deletion of unnecessary checks before the function call "pci_dev_put"
Message-Id: <20141202183509.GI4994@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <547BC5AD.6090500@users.sourceforge.net>
 <1417465745.28610.0.camel@sipsolutions.net>
 <alpine.DEB.2.02.1412012134290.2076@localhost6.localdomain6>
 <1417539208.1841.1.camel@sipsolutions.net>
In-Reply-To: <1417539208.1841.1.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>, Lino Sanfilippo <LinoSanfilippo@gmx.de>, Olof Johansson <olof@lixom.net>, netdev@vger.kernel.org, backports@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>

On Tue, Dec 02, 2014 at 05:53:28PM +0100, Johannes Berg wrote:
> On Mon, 2014-12-01 at 21:34 +0100, Julia Lawall wrote:
> 
> > > So this kind of evolution is no problem for the (automated) backports
> > > using the backports project - although it can be difficult to detect
> > > such a thing is needed.
> > 
> > That is exactly the problem...
> 
> I'm not convinced though that it should stop such progress in mainline.

Is it progress?  These patches match the code look simpler by passing
hiding the NULL check inside a function call.  Calling pci_dev_put(NULL)
doesn't make sense.  Just because a sanity check exists doesn't mean we
should do insane things.

It's easy enough to store which functions have a sanity check in a
database, but to rememember all that as a human being trying to read the
code is impossible.

If we really wanted to make this code cleaner we would introduce more
error labels with better names.

regards,
dan carpenter

