From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jun 2012 07:12:22 +0000
Subject: Re: automated warning notifications
Message-Id: <20120615071222.GZ13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120614172523.GB4400@mwanda>
 <20120615014835.GA5695@localhost>
In-Reply-To: <20120615014835.GA5695@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <wfg@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 15, 2012 at 09:48:35AM +0800, Fengguang Wu wrote:
> The lots of false warnings are a big problem. It makes the automated
> notification more noises than signals to people. So I end up disabling
> the sparse check totally..
> 

I do a basic sanity check of my emails before I send them.

Sometimes I do send false positives.  If the warning is introduced
by a very new code then probably the patch author can answer my
question off the top of her head.  Also I send some false positives
just to try learn what the rules are.

> In an average working day, 1-2 build errors will be caught and email
> notified. I guess there will be more sparse warnings if it's turned
> on.
> 
> Perhaps the sparse warnings can be enabled, but only sent to the patch
> author. If you and anyone else are interested, they could be sent to
> some mailing list, too. One thing I'm sure is, we probably never want
> to disturb the busy maintainers with these warnings.

Eventually I think we will want to set up a mailing list for this or
we will start sending duplicate messages.

regards,
dan carpenter

