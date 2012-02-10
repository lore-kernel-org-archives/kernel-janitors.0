From: Szymon Janc <szymon@janc.net.pl>
Date: Fri, 10 Feb 2012 19:21:16 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <201202102021.17053.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thursday 09 February 2012 21:23:02 Greg KH wrote:

> > Those 2 (minor) are still not applied
> > 
> > Staging: quickstart: Use scnprintf in quickstart_pressed_button_show
> > Staging: quickstart: Bump driver version to 1.04
> 
> I thought you told me not to apply them?
> 
> Anyway, care to resend them so I know exactly what to apply?

I've accidentally mixed V1 and V2 patches in V2 series and was referring to 
those V1 sent with V2,  but I'll resent them for clarity.

> 
> > > Also, you just created the following build warning, please send me a
> > > patch fixing it up:
> > > 
> > > drivers/staging/quickstart/quickstart.c: In function
> > > ‘quickstart_acpi_ghid’: drivers/staging/quickstart/quickstart.c:212:5:
> > > warning: format ‘%u’ expects argument of type ‘unsigned int’, but
> > > argument 3 has type ‘acpi_size’ [-Wformat]
> > 
> > acpi_size is u32 or u64 depending on arch, is it ok to just cast it to
> > unsigned int for printing?
> 
> There should be some native type for this, size_t?  Or if it's not
> really important, just cast it.

This is how is it defined in <acpi/actypes.h>. I'll just cast it to unsigned 
long for pritning.



One more thing:
there is no TODO for quickstart in staging so I fixed what I 
felt should be fixed (I'm quite a newbie). If you have some comments on what 
still needs to be done to get this driver from staging I'm all ears.

-- 
Szymon K. Janc
szymon@janc.net.pl

