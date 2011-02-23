From: Greg KH <greg@kroah.com>
Date: Wed, 23 Feb 2011 18:54:19 +0000
Subject: Re: [patch 2/2] staging: ath6kl: buffer overflow in SEND_FRAME ioctl
Message-Id: <20110223185419.GA686@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124953.GB1898@bicker>
In-Reply-To: <20110220124953.GB1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Feb 23, 2011 at 10:40:50AM -0800, Luis R. Rodriguez wrote:
> On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrote:
> 
> > Acked-by: Vipin Mehta <vipin.mehta@atheros.com>
> 
> Greg, Joe is not sure if these patches will be applied as-is and his
> cleanup depends on code being static, I think they would be there is a
> chance you might muck them a bit and this would break any cleanup
> work. Will these patches be merged as-is, can Joe for example git am
> these into his tree as-is and work off of the assumption that they
> will reflect the top of staging-next + these patches?

I already answered Joe about this yesterday, was that response somehow
not sufficient?

thanks,

greg "tired of repeating myself" k-h
