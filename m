From: "=?ISO-8859-1?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@helsinki.fi>
Date: Sun, 03 Aug 2008 15:12:36 +0000
Subject: Re: [PATCH] resend: Remove warning 'unused variable battery' in
Message-Id: <Pine.LNX.4.64.0808031810220.31690@wrl-59.cs.helsinki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
In-Reply-To: <ea11fea30808030612m7ab72e85xf34e290d674d955d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 3 Aug 2008, Manish Katiyar wrote:

> >>  static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
> >>  {
> >> +#if defined (CONFIG_ACPI_SYSFS_POWER) || (CONFIG_ACPI_PROCFS_POWER)
> >
> > Sorry, my bad this time, you actually need to have defined() around both
> > of the config symbols though I forgot it in one of them in my example
> > because I was using dots instead of real ones that would have made that
> > mistake obvious due to capitalization.
> 
> Sorry... I didn't understand :-( ....... I compile tested the patch.

There are plenty of examples available:

$ git-grep '\#if.*||'
...


-- 
 i.
