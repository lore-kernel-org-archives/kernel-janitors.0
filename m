From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Sat, 25 Feb 2006 14:13:30 +0000
Subject: Re: [KJ] [PATCH] check request_region return value
Message-Id: <9a8748490602250613g36f8a698s6f214b9abe05ce88@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/25/06, Tim Cooijmans <tim@aapopfiets.nl> wrote:
> From: Tim Cooijmans <tim@aapopfiets.nl>
>
> Check request_region return value in drivers/acpi/motherboard.c.
> acpi_reserve_resources now returns int, 0 being success.
> acpi_motherboard_init propagates that return value.
>
> Passed compilation.
>

Some comments below.


> Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
> ---
> --- linux-2.6.16-rc4-orig/drivers/acpi/motherboard.c    2006-02-21
> 20:18:41.000000000 +0100
> +++ linux-2.6.16-rc4/drivers/acpi/motherboard.c 2006-02-25 14:08:01.000000000
> +0100
> @@ -123,42 +123,115 @@ static struct acpi_driver acpi_motherboa
>                 },
>  };
>
> -static void __init acpi_reserve_resources(void)
> +static int __init acpi_reserve_resources(void)
>  {
>         if (acpi_gbl_FADT->xpm1a_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
> -               request_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
> -                              acpi_gbl_FADT->pm1_evt_len, "PM1a_EVT_BLK");
> +               if (request_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
> +                                  acpi_gbl_FADT->pm1_evt_len,
> +                                  "PM1a_EVT_BLK") = NULL) {

Why not

+               if (!request_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
+                                  acpi_gbl_FADT->pm1_evt_len,
+                                  "PM1a_EVT_BLK")) {

Shorter and easier to read IMHO.


> +                       printk(KERN_WARNING "acpi_reserve_resources: could not"
> +                                           "allocate PM1a_EVT_BLK region\n");
> +                       goto out_pm1a_evt_blk;
> +               }
>

If you want to print a warning for each case, why not make a simple
wrapper function that calls request_region and prints the warning
instead of having a ton of printk()s ?


> +out_gpe1_blk:
> +       if (acpi_gbl_FADT->xgpe0_blk.address && acpi_gbl_FADT->gpe0_blk_len &&
> +           !(acpi_gbl_FADT->gpe0_blk_len & 0x1))
> +               release_region(acpi_gbl_FADT->xgpe0_blk.address,
> +                              acpi_gbl_FADT->gpe0_blk_len);
> +out_gpe0_blk:
> +       if (acpi_gbl_FADT->xpm2_cnt_blk.address && acpi_gbl_FADT->pm2_cnt_len)
> +               release_region(acpi_gbl_FADT->xpm2_cnt_blk.address,
> +                              acpi_gbl_FADT->pm2_cnt_len);
> +out_pm2_cnt_blk:
> +       if (acpi_gbl_FADT->xpm_tmr_blk.address && acpi_gbl_FADT->pm_tm_len = 4)
> +               release_region(acpi_gbl_FADT->xpm_tmr_blk.address, 4);
> +out_pm_tmr:
> +       if (acpi_gbl_FADT->xpm1b_cnt_blk.address && acpi_gbl_FADT->pm1_cnt_len)
> +               release_region(acpi_gbl_FADT->xpm1b_cnt_blk.address,
> +                              acpi_gbl_FADT->pm1_cnt_len);
> +out_pm1b_cnt_blk:
> +       if (acpi_gbl_FADT->xpm1a_cnt_blk.address && acpi_gbl_FADT->pm1_cnt_len)
> +               release_region(acpi_gbl_FADT->xpm1a_cnt_blk.address,
> +                              acpi_gbl_FADT->pm1_cnt_len);
> +out_pm1a_cnt_blk:
> +       if (acpi_gbl_FADT->xpm1b_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
> +               release_region(acpi_gbl_FADT->xpm1b_evt_blk.address,
> +                              acpi_gbl_FADT->pm1_evt_len);
> +out_pm1b_evt_blk:
> +       if (acpi_gbl_FADT->xpm1a_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
> +               release_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
> +                              acpi_gbl_FADT->pm1_evt_len);
> +out_pm1a_evt_blk:
> +       return -EBUSY;
>  }
>

Why all these if's in the error path? Since you get to any of these
labels in the first place you already know what request_region()s
succeeded, so what's the point of checking all these variables before
calling release_region()?


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
