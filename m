From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sat, 25 Feb 2006 17:26:42 +0000
Subject: Re: [KJ] [PATCH] check request_region return value
Message-Id: <200602251826.43230.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 25 February 2006 15:13, Jesper Juhl wrote:
> > +out_gpe1_blk:
> > +       if (acpi_gbl_FADT->xgpe0_blk.address &&
> > acpi_gbl_FADT->gpe0_blk_len && +           !(acpi_gbl_FADT->gpe0_blk_len
> > & 0x1))
> > +               release_region(acpi_gbl_FADT->xgpe0_blk.address,
> > +                              acpi_gbl_FADT->gpe0_blk_len);
> > +out_gpe0_blk:
> > +       if (acpi_gbl_FADT->xpm2_cnt_blk.address &&
> > acpi_gbl_FADT->pm2_cnt_len) +              
> > release_region(acpi_gbl_FADT->xpm2_cnt_blk.address, +                    
> >          acpi_gbl_FADT->pm2_cnt_len);
> > +out_pm2_cnt_blk:
> > +       if (acpi_gbl_FADT->xpm_tmr_blk.address &&
> > acpi_gbl_FADT->pm_tm_len = 4) +              
> > release_region(acpi_gbl_FADT->xpm_tmr_blk.address, 4); +out_pm_tmr:
> > +       if (acpi_gbl_FADT->xpm1b_cnt_blk.address &&
> > acpi_gbl_FADT->pm1_cnt_len) +              
> > release_region(acpi_gbl_FADT->xpm1b_cnt_blk.address, +                   
> >           acpi_gbl_FADT->pm1_cnt_len);
> > +out_pm1b_cnt_blk:
> > +       if (acpi_gbl_FADT->xpm1a_cnt_blk.address &&
> > acpi_gbl_FADT->pm1_cnt_len) +              
> > release_region(acpi_gbl_FADT->xpm1a_cnt_blk.address, +                   
> >           acpi_gbl_FADT->pm1_cnt_len);
> > +out_pm1a_cnt_blk:
> > +       if (acpi_gbl_FADT->xpm1b_evt_blk.address &&
> > acpi_gbl_FADT->pm1_evt_len) +              
> > release_region(acpi_gbl_FADT->xpm1b_evt_blk.address, +                   
> >           acpi_gbl_FADT->pm1_evt_len);
> > +out_pm1b_evt_blk:
> > +       if (acpi_gbl_FADT->xpm1a_evt_blk.address &&
> > acpi_gbl_FADT->pm1_evt_len) +              
> > release_region(acpi_gbl_FADT->xpm1a_evt_blk.address, +                   
> >           acpi_gbl_FADT->pm1_evt_len);
> > +out_pm1a_evt_blk:
> > +       return -EBUSY;
> >  }
>
> Why all these if's in the error path? Since you get to any of these
> labels in the first place you already know what request_region()s
> succeeded, so what's the point of checking all these variables before
> calling release_region()?
Not all request_region()s are tried.  These checks are done before requesting 
them as well, to determine which ones should be requested.  If I don't do 
these checks here, some release_region() calls will try to release regions 
that were never requested.

I'll look into your other comments.

Thanks,
Tim
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
