From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 17 Jun 2020 10:53:39 +0000
Subject: Re: [PATCH] coresight: cti: Fix error handling in probe
Message-Id: <CAJ9a7ViP_PTiSnYnOYbH=LRXUroWT04rmdswZEdakoWjevUi4Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200612121047.GF4282@kadam> <20200612121133.GA1139533@mwanda>
 <20200612174215.GI4282@kadam>
In-Reply-To: <20200612174215.GI4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Dan,

On Fri, 12 Jun 2020 at 18:43, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jun 12, 2020 at 03:11:33PM +0300, Dan Carpenter wrote:
> > +static int cti_pm_setup(struct cti_drvdata *drvdata)
> > +{
> > +     int ret;
> > +
> > +     if (drvdata->ctidev.cpu = -1)
> > +             return 0;
> > +
> > +     if (nr_cti_cpu)
> > +             goto done;
> > +
> > +     cpus_read_lock();
>         ^^^^^^^^^^^^^^^^
> One thing which I do wonder is why we have locking here but not in the
> cti_pm_release() function.  That was how the original code was so the
> patch doesn't change anything, but I am curious.
>

Good point - the CTI PM code was modelled on the same code in the ETM
drivers, which show the same pattern.
Perhaps something we need to revisit in both drivers.

Regards

Mike

> > +     ret = cpuhp_setup_state_nocalls_cpuslocked(
> > +                     CPUHP_AP_ARM_CORESIGHT_CTI_STARTING,
> > +                     "arm/coresight_cti:starting",
> > +                     cti_starting_cpu, cti_dying_cpu);
> > +     if (ret) {
> > +             cpus_read_unlock();
> > +             return ret;
> > +     }
> > +
> > +     ret = cpu_pm_register_notifier(&cti_cpu_pm_nb);
> > +     cpus_read_unlock();
> > +     if (ret) {
> > +             cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> > +             return ret;
> > +     }
> > +
> > +done:
> > +     nr_cti_cpu++;
> > +     cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> > +
> > +     return 0;
> > +}
> > +
> >  /* release PM registrations */
> >  static void cti_pm_release(struct cti_drvdata *drvdata)
> >  {
> > -     if (drvdata->ctidev.cpu >= 0) {
> > -             if (--nr_cti_cpu = 0) {
> > -                     cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> > +     if (drvdata->ctidev.cpu = -1)
> > +             return;
> >
> > -                     cpuhp_remove_state_nocalls(
> > -                             CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> > -             }
> > -             cti_cpu_drvdata[drvdata->ctidev.cpu] = NULL;
> > +     cti_cpu_drvdata[drvdata->ctidev.cpu] = drvdata;
> > +     if (--nr_cti_cpu = 0) {
> > +             cpu_pm_unregister_notifier(&cti_cpu_pm_nb);
> > +             cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_CTI_STARTING);
> >       }
> >  }
>
> regards,
> dan carpenter
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
