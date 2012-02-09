From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 09 Feb 2012 20:23:02 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <20120209202302.GA22270@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 09, 2012 at 09:14:18PM +0100, Szymon Janc wrote:
> Hi,
> 
> > Ok, I think I got the right ones, please check that I did.
> 
> Those 2 (minor) are still not applied
> 
> Staging: quickstart: Use scnprintf in quickstart_pressed_button_show
> Staging: quickstart: Bump driver version to 1.04

I thought you told me not to apply them?

Anyway, care to resend them so I know exactly what to apply?

> > Also, you just created the following build warning, please send me a
> > patch fixing it up:
> > 
> > drivers/staging/quickstart/quickstart.c: In function
> > ‘quickstart_acpi_ghid’: drivers/staging/quickstart/quickstart.c:212:5:
> > warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument
> > 3 has type ‘acpi_size’ [-Wformat]
> 
> acpi_size is u32 or u64 depending on arch, is it ok to just cast it to 
> unsigned int for printing?

There should be some native type for this, size_t?  Or if it's not
really important, just cast it.

thanks,

greg k-h
