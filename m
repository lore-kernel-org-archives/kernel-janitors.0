From: Greg KH <greg@kroah.com>
Date: Thu, 22 Jul 2010 17:59:32 +0000
Subject: Re: [PATCH 1/4] staging/spectra: remove duplicate GLOB_VERSION
Message-Id: <20100722175932.GB28783@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279399194.14049.18.camel@lenovo>
In-Reply-To: <1279399194.14049.18.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 17, 2010 at 04:39:54PM -0400, Javier Martinez Canillas wrote:
> This is the first patch of a patchset that removes all compilations warnings in staging/spectra.
> 
> These patches are a delta from a previous patchset and it assumes that these three patches all already applied:
> 
> [PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
> [PATCH 2/3] fix staging/spectra: use new REQ_FLUSH flag
> [PATCH 3/3] fix staging/spectra: don't use locked_ioctl

I'll have to wait until the merge window opens to apply the first
patches, otherwise it breaks the build here.  So I'll have to wait on
these patches as well.

thanks,

greg k-h
