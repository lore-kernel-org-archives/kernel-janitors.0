From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 08 Sep 2014 19:50:33 +0000
Subject: Re: [PATCH 3/7] staging: lustre: lov: expand the GOTO macro
Message-Id: <20140908195033.GA7006@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1410106715-9573-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1410106715-9573-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: devel@driverdev.osuosl.org, "Dilger, Andreas" <andreas.dilger@intel.com>, Peng Tao <bergwolf@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Drokin, Oleg" <oleg.drokin@intel.com>

On Sun, Sep 07, 2014 at 06:18:31PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier lbl;
> identifier rc;
> constant c;
> @@
> 
> - GOTO(lbl,\(rc\|c\));
> + goto lbl;
> 
> @@
> identifier lbl;
> expression rc;
> @@
> 
> - GOTO(lbl,rc);
> + rc;
> + goto lbl;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/staging/lustre/lustre/lov/lov_obd.c     |  154 ++++++++++------
>  drivers/staging/lustre/lustre/lov/lov_object.c  |   13 -
>  drivers/staging/lustre/lustre/lov/lov_pack.c    |   23 +-
>  drivers/staging/lustre/lustre/lov/lov_page.c    |   12 -
>  drivers/staging/lustre/lustre/lov/lov_pool.c    |   38 ++--
>  drivers/staging/lustre/lustre/lov/lov_request.c |  226 +++++++++++++++---------
>  6 files changed, 304 insertions(+), 162 deletions(-)

There were some patches ahead of yours in this area that prevented this
patch from applying.

Can you refresh this against my latest tree (staging-next branch of
staging.git on git.kernel.org) and resend?

thanks,

greg k-h
