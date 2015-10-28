From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Wed, 28 Oct 2015 02:48:51 +0000
Subject: Re: [patch] ACPI/CPPC: signedness bug in register_pcc_channel()
Message-Id: <5316804.7ejJEpFp8J@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151022195259.GC24439@mwanda> <CAJ5Y-ebKF1Au2C9Q3vyvmugDEomfqhO89KAgsUrph4sgxT_t9w@mail.gmail.com>
In-Reply-To: <CAJ5Y-ebKF1Au2C9Q3vyvmugDEomfqhO89KAgsUrph4sgxT_t9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashwin Chaugule <ashwin.chaugule@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Len Brown <lenb@kernel.org>, linux acpi <linux-acpi@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Friday, October 23, 2015 04:45:09 AM Ashwin Chaugule wrote:
> On 22 October 2015 at 15:52, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > The "pcc_subspace_idx" is -1 if it hasn't been initialized yet.  We need
> > it to be signed.
> >
> > Fixes: 337aadff8e45 ('ACPI: Introduce CPU performance controls using CPPC')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> > index 0bbf84b..2ed5516 100644
> > --- a/drivers/acpi/cppc_acpi.c
> > +++ b/drivers/acpi/cppc_acpi.c
> > @@ -302,7 +302,7 @@ err_ret:
> >  }
> >  EXPORT_SYMBOL_GPL(acpi_get_psd_map);
> >
> > -static int register_pcc_channel(unsigned pcc_subspace_idx)
> > +static int register_pcc_channel(int pcc_subspace_idx)
> >  {
> >         struct acpi_pcct_subspace *cppc_ss;
> >         unsigned int len;
> 
> Acked-by: Ashwin Chaugule <ashwin.chaugule@linaro.org>

Applied, thanks!

Rafael

