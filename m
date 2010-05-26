From: Greg KH <gregkh@suse.de>
Date: Wed, 26 May 2010 14:35:33 +0000
Subject: Re: [patch] kobject: free memory if netlink_kernel_create() fails
Message-Id: <20100526143533.GA5644@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525095110.GG22515@bicker>
 <m1d3wk2s7y.fsf@fess.ebiederm.org>
 <20100526.004347.115926528.davem@davemloft.net>
In-Reply-To: <20100526.004347.115926528.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: ebiederm@xmission.com, error27@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 26, 2010 at 12:43:47AM -0700, David Miller wrote:
> From: ebiederm@xmission.com (Eric W. Biederman)
> Date: Tue, 25 May 2010 03:25:37 -0700
> 
> > Dan Carpenter <error27@gmail.com> writes:
> > 
> >> There is a kfree(ue_sk) missing on the error path if 
> >> netlink_kernel_create() fails.
> >>
> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
> > Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>
> 
> Greg, I assume you've got this one?

Yes, I'll queue it up in a day or so.

thanks,

greg k-h
