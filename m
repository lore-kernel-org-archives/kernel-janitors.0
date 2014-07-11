From: Davide Gianforte <davide@gengisdave.org>
Date: Fri, 11 Jul 2014 07:12:25 +0000
Subject: Re: [PATCH 2/2] staging: silicom: function return fixes
Message-Id: <3841595.FCr3AICt7G@mayhem>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1972083.WZLDx2N35Z@mayhem> <1488578.ritUTSl26I@mayhem> <20140709185914.GA28612@kroah.com>
In-Reply-To: <20140709185914.GA28612@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Linux Kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Wed, Jul 09, 2014 at 11:59:14, Greg Kroah-Hartman wrote:
> On Tue, Jul 01, 2014 at 02:33:43PM +0200, Davide Gianforte wrote:
> > +	uint32_t ctrl_ext = BPCTL_READ_REG(pbpctl_dev, CTRL_EXT);
> >  
> > -	ctrl_ext = BPCTL_READ_REG(pbpctl_dev, CTRL_EXT);
> 
> How about just removing the " = 0;" part of the variable definition?
> That would be a smaller patch, and still keep everything "clean".
> 
> thanks,
> 
> greg k-h

Also I prefer the style to keep definitions separated from assignments.
I've seen a lot of kernel code which initialize variables with function returns,
but as you said, it is not "clean", even if it is code-correct.

I'll rewrite the patch and I will send asap.

thanks
davide
