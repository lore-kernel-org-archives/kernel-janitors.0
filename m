From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 01 Sep 2019 15:30:37 +0000
Subject: Re: [PATCH] autofs: remove redundant assignment to variable err
Message-Id: <01ec26e2-6fd9-5ea0-4ef7-6a47e00bb2c5@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190901152251.11374-1-colin.king@canonical.com>
In-Reply-To: <20190901152251.11374-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Ian Kent <raven@themaw.net>, autofs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 01/09/2019 à 17:22, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable err is being assigned a value that is never read and
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
>
> Addresses-Coverity: ("Ununsed value")

Ununsed?


> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   fs/autofs/dev-ioctl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/autofs/dev-ioctl.c b/fs/autofs/dev-ioctl.c
> index a3cdb0036c5d..65d84b4d4464 100644
> --- a/fs/autofs/dev-ioctl.c
> +++ b/fs/autofs/dev-ioctl.c
> @@ -422,7 +422,7 @@ static int autofs_dev_ioctl_requester(struct file *fp,
>   	struct autofs_info *ino;
>   	struct path path;
>   	dev_t devid;
> -	int err = -ENOENT;
> +	int err;
>   
>   	/* param->path has been checked in validate_dev_ioctl() */
>   
