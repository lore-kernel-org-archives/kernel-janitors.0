From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 05 Mar 2014 19:41:52 +0000
Subject: Re: [PATCH] staging: cxt1e1: moved version string declaration
Message-Id: <20140305194152.GB15800@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1394047771-3244238-1-git-send-email-shaun@xresource.ca>
In-Reply-To: <1394047771-3244238-1-git-send-email-shaun@xresource.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Mar 05, 2014 at 12:29:31PM -0700, Shaun Laing wrote:
> To resolve a sparse "should it be static" warning, the declaration for the
> pmcc4_OSSI_release version string was moved from its own file to linux.c, and
> the resulting empty file was deleted.
> 
> Signed-off-by: Shaun Laing <shaun@xresource.ca>
> ---
>  drivers/staging/cxt1e1/Makefile      |    1 -
>  drivers/staging/cxt1e1/linux.c       |    3 ++-
>  drivers/staging/cxt1e1/ossiRelease.c |   29 -----------------------------
>  3 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 drivers/staging/cxt1e1/ossiRelease.c

Just remove the string entirely, it's not needed anymore now that the
driver is in the kernel source tree.

thanks,

greg k-h
