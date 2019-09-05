From: Bjorn Helgaas <helgaas@kernel.org>
Date: Thu, 05 Sep 2019 21:47:12 +0000
Subject: Re: [PATCH -next] PCI: Use GFP_ATOMIC in resource_alignment_store()
Message-Id: <20190905214712.GJ103977@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831124932.18759-1-yuehaibing@huawei.com>
 <20190902075006.GB754@infradead.org>
 <9d2094f7-eb71-4975-eb9b-166a1483afa0@deltatee.com>
In-Reply-To: <9d2094f7-eb71-4975-eb9b-166a1483afa0@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Christoph Hellwig <hch@infradead.org>, YueHaibing <yuehaibing@huawei.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 03, 2019 at 09:51:05AM -0600, Logan Gunthorpe wrote:
> 
> 
> On 2019-09-02 1:50 a.m., Christoph Hellwig wrote:
> > On Sat, Aug 31, 2019 at 12:49:32PM +0000, YueHaibing wrote:
> >> When allocating memory, the GFP_KERNEL cannot be used during the
> >> spin_lock period. It may cause scheduling when holding spin_lock.
> >>
> >> Fixes: f13755318675 ("PCI: Move pci_[get|set]_resource_alignment_param() into their callers")
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >> ---
> >>  drivers/pci/pci.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> >> index 484e35349565..0b5fc6736f3f 100644
> >> --- a/drivers/pci/pci.c
> >> +++ b/drivers/pci/pci.c
> >> @@ -6148,7 +6148,7 @@ static ssize_t resource_alignment_store(struct bus_type *bus,
> >>  	spin_lock(&resource_alignment_lock);
> >>  
> >>  	kfree(resource_alignment_param);
> >> -	resource_alignment_param = kstrndup(buf, count, GFP_KERNEL);
> >> +	resource_alignment_param = kstrndup(buf, count, GFP_ATOMIC);
> >>  
> >>  	spin_unlock(&resource_alignment_lock);
> > 
> > Why not move the allocation outside the lock? Something like this
> > seems much more sensible:
> 
> Yes, that seems like a good way to do it. Bjorn, can you squash
> Christoph's patch or do you want me to resend a new one?

I folded Christoph's fix into it, thanks!

> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 484e35349565..fe205829f676 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -6145,14 +6145,16 @@ static ssize_t resource_alignment_show(struct bus_type *bus, char *buf)
> >  static ssize_t resource_alignment_store(struct bus_type *bus,
> >  					const char *buf, size_t count)
> >  {
> > -	spin_lock(&resource_alignment_lock);
> > +	char *param = kstrndup(buf, count, GFP_KERNEL);
> >  
> > -	kfree(resource_alignment_param);
> > -	resource_alignment_param = kstrndup(buf, count, GFP_KERNEL);
> > +	if (!param)
> > +		return -ENOMEM;
> >  
> > +	spin_lock(&resource_alignment_lock);
> > +	kfree(resource_alignment_param);
> > +	resource_alignment_param = param;
> >  	spin_unlock(&resource_alignment_lock);
> > -
> > -	return resource_alignment_param ? count : -ENOMEM;
> > +	return count;
> >  }
> >  
> >  static BUS_ATTR_RW(resource_alignment);
> > 
