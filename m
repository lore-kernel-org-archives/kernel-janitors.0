From: Dan Carpenter <error27@gmail.com>
Date: Sun, 19 Sep 2010 15:12:58 +0000
Subject: Re: [PATCH 10/14] scsi: osd: fix device_register() error handling
Message-Id: <20100919151258.GG6236@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900907-24621-1-git-send-email-segooon@gmail.com> <20100919142653.GF6236@bicker> <20100919143948.GA4866@albatros>
In-Reply-To: <20100919143948.GA4866@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Boaz Harrosh <bharrosh@panasas.com>, Benny Halevy <bhalevy@panasas.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, cornelia.huck@de.ibm.com, linux-kernel@vger.kernel.org

On Sun, Sep 19, 2010 at 06:39:50PM +0400, Vasiliy Kulikov wrote:
> > 
> > If that's the case then the put_device() should be called infront of the
> > goto.
> 
> As it is the last call that may fail, it is redundant.  Or you mean for future,
> if someone adds more code after device_register()?
> 

Yes.  I mean in the future.

regards,
dan carpenter

>  
> Thanks,
> -- 
> Vasiliy
