From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 21 Oct 2019 14:43:10 +0000
Subject: Re: [PATCH] acpi/nfit: unlock on error in scrub_show()
Message-Id: <CAPcyv4jL=7WFjxK1UmWRoxup0gDzjapLdt7GxwOsg1xYEPr4ew@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191018123534.GA6549@mwanda> <CAJZ5v0jeoJrrn56VqRSoY-Mc9rp04tWYbTCsQugZV=vXQk0nNg@mail.gmail.com>
In-Reply-To: <CAJZ5v0jeoJrrn56VqRSoY-Mc9rp04tWYbTCsQugZV=vXQk0nNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Keith Busch <keith.busch@intel.com>, Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Oct 20, 2019 at 4:35 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Fri, Oct 18, 2019 at 2:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > We change the locking in this function and forgot to update this error
> > path so we are accidentally still holding the "dev->lockdep_mutex".
> >
> > Fixes: 87a30e1f05d7 ("driver-core, libnvdimm: Let device subsystems add local lockdep coverage")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/acpi/nfit/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
> > index 1413324982f0..14e68f202f81 100644
> > --- a/drivers/acpi/nfit/core.c
> > +++ b/drivers/acpi/nfit/core.c
> > @@ -1322,7 +1322,7 @@ static ssize_t scrub_show(struct device *dev,
> >         nfit_device_lock(dev);
> >         nd_desc = dev_get_drvdata(dev);
> >         if (!nd_desc) {
> > -               device_unlock(dev);
> > +               nfit_device_unlock(dev);
> >                 return rc;
> >         }
> >         acpi_desc = to_acpi_desc(nd_desc);
> > --
>
> Applying as a fix for 5.4, thanks!
>
> @Dan W: Please let me know if you'd rather take it yourself.

If you already have it applied, I have no concerns.

Acked-by: Dan Williams <dan.j.williams@intel.com>
