From: Alan Cox <alan@linux.intel.com>
Date: Wed, 04 Jan 2012 11:48:22 +0000
Subject: Re: [patch] gma500: silence gcc warnings in mid_get_vbt_data()
Message-Id: <20120104114822.0fd32fba@bob.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120104072610.GH30978@elgon.mountain>
In-Reply-To: <20120104072610.GH30978@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Dave Airlie <airlied@redhat.com>

On Wed, 4 Jan 2012 10:26:10 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Add a cast here to silence a Gcc warning.
> drivers/gpu/drm/gma500/mid_bios.c:214:28: warning:
>   cast from pointer to integer of different size
> [-Wpointer-to-int-cast]
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Compile tested only.

It's actually a non-bug (no 64bit boxes and we always take from within
the low 32bits). I guess gcc would have to extremely smart to figure
that out though.

Acked-by: Alan Cox <alan@linux.intel.com>
