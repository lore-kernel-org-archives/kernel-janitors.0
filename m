From: walter harms <wharms@bfs.de>
Date: Thu, 03 Apr 2014 15:14:29 +0000
Subject: Re: [PATCH] staging: vme: Fix a small coding style issue in vme_user.c
Message-Id: <533D7AD5.8070509@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 03.04.2014 00:24, schrieb Bojan Prtvar:
> The checkpatch.pl complains about missing blank line after declaration.
> This patch silence the warning.
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
>  This patch is for Eudyptula Challenge task 10
> 
>  drivers/staging/vme/devices/vme_user.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
> index 7927927..481192a 100644
> --- a/drivers/staging/vme/devices/vme_user.c
> +++ b/drivers/staging/vme/devices/vme_user.c
> @@ -791,6 +791,7 @@ static int vme_user_probe(struct vme_dev *vdev)
>  	/* Add sysfs Entries */
>  	for (i = 0; i < VME_DEVS; i++) {
>  		int num;
> +
>  		switch (type[i]) {
>  		case MASTER_MINOR:
>  			sprintf(name, "bus/vme/m%%d");

beside style:
that sprint looks like as it could be replaced with a
 name="bus/vme/m%%d"

any takers ?

re,
 wh

