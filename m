From: Thomas Renninger <trenn@suse.de>
Date: Fri, 19 Feb 2010 11:02:28 +0000
Subject: Re: [PATCH] drivers: acpi: fan.c move a dereference below the NULL test
Message-Id: <201002191202.28792.trenn@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1265882202.27789.0.camel@ICE-BOX> <alpine.LFD.2.00.1002190026070.17638@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.1002190026070.17638@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: Darren Jenkins <darrenrjenkins@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>, Matthew Garrett <mjg@redhat.com>, linux ACPI <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Friday 19 February 2010 06:27:46 Len Brown wrote:
> I think think this is a run-time check for a programming error,
> and the current fashion is to delete the check and take a fault
> if this happens so the caller can be fixed.
> 
> There are a couple of checks like this in fan.c --
> perhaps Rui can clean them up when he comes back next week.
Please let us clean this up first and remove:
static inline void *acpi_driver_data(struct acpi_device *d)
{
        return d->driver_data;
}
This has nothing to do with acpica code, it's in kernel code only.
Is there a reason for above abstraction?
If not, it's error prone and really should get eliminated.

    Thomas

> thanks,
> Len Brown, Intel Open Source Technology Center
> 
> On Thu, 11 Feb 2010, Darren Jenkins wrote:
> 
> > In acpi_fan_remove() device is being dereferenced before the NULL 
test.
> > This reorders the code to ensure it is checked for NULL first.
> > 
> > Coverity CID: 2758
> > 
> > Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> > ---
> >  drivers/acpi/fan.c |    9 +++++++--
> >  1 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/acpi/fan.c b/drivers/acpi/fan.c
> > index acf2ab2..dc39640 100644
> > --- a/drivers/acpi/fan.c
> > +++ b/drivers/acpi/fan.c
> > @@ -298,9 +298,14 @@ static int acpi_fan_add(struct acpi_device 
*device)
> >  
> >  static int acpi_fan_remove(struct acpi_device *device, int type)
> >  {
> > -	struct thermal_cooling_device *cdev = acpi_driver_data(device);
> > +	struct thermal_cooling_device *cdev;
> > +
> > +	if (!device)
> > +		return -EINVAL;
> > +
> > +	cdev = acpi_driver_data(device);
> >  
> > -	if (!device || !cdev)
> > +	if (!cdev)
> >  		return -EINVAL;
> >  
> >  	acpi_fan_remove_fs(device);
> > -- 
> > 1.6.3.3
> > 
> > 
> > 
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-
kernel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> > 
> 

