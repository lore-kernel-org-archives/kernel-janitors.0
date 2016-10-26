From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 26 Oct 2016 12:28:59 +0000
Subject: Re: [PATCH 11/13] ALSA: Deletion of checks before the function call "iounmap"
Message-Id: <1477484939.4059.35.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54A9355F.4050102@users.sourceforge.net>
 <54A941C1.4020906@users.sourceforge.net> <20161026122605.GA3911@mwanda>
In-Reply-To: <20161026122605.GA3911@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Russell King <linux@arm.linux.org.uk>, linux-parisc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Julia Lawall <julia.lawall@lip6.fr>, Thibaut Varene <T-Bone@parisc-linux.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2016-10-26 at 15:26 +0300, Dan Carpenter wrote:
> Someone was just mentioning in another thread that removing the check
> from iounmap() is not portable to other arches and then I remembered
> that Markus removed a bunch of these.
> 
> We should consider reverting this, perhaps?

Can't we teach all architectures? Not that reverting it would be a
problem.

johannes
