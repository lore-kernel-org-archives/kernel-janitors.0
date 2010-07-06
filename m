From: James Bottomley <James.Bottomley@suse.de>
Date: Tue, 06 Jul 2010 15:39:19 +0000
Subject: Re: [PATCH] enclosure: fix lost return
Message-Id: <1278430759.2854.80.camel@mulgrave.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278430088-9761-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278430088-9761-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Tejun Heo <tj@kernel.org>, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>

On Tue, 2010-07-06 at 19:28 +0400, Kulikov Vasiliy wrote:
> Useless statement must be return with argument.
> 
> This patch silences a compiler warning:
> drivers/misc/enclosure.c: In function ‘enclosure_component_register’:
> drivers/misc/enclosure.c:289: warning: ignoring return value of ‘ERR_PTR’, declared with attribute warn_unused_result
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/misc/enclosure.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/misc/enclosure.c b/drivers/misc/enclosure.c
> index 48c84a5..9ae7bef 100644
> --- a/drivers/misc/enclosure.c
> +++ b/drivers/misc/enclosure.c
> @@ -286,7 +286,7 @@ enclosure_component_register(struct enclosure_device *edev,
>  
>  	err = device_register(cdev);
>  	if (err)
> -		ERR_PTR(err);
> +		return ERR_PTR(err);

Well, the patch isn't quite correct, but I think I win a prize for
working out what the correct patch was and then forgetting to apply it:

http://marc.info/?l=linux-scsi&m6843630320666

I've actually put it in my tree this time ...

James


