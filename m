From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Sun, 14 Jun 2015 07:02:24 +0000
Subject: Re: [patch] drm/amdkfd: fix some range checks in address watch ioctl
Message-Id: <CAFCwf104O_p9ZdKafD0UPOyXqTja6jchtVc2Vq-aMQWkoCwuBw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611151902.GF12192@mwanda>
In-Reply-To: <20150611151902.GF12192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yair Shachar <yair.shachar@amd.com>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jun 11, 2015 at 6:19 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>  #include "kfd_dbgmgr.h"
> +#include "../../radeon/cik_reg.h"
>
>  static long kfd_ioctl(struct file *, unsigned int, unsigned long);

We can't include radeon files in kfd_chardev.c, because amdkfd works
with two device drivers - radeon and amdgpu - and this file should be
H/W / Driver agnostic.

Oded
