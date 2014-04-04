From: walter harms <wharms@bfs.de>
Date: Fri, 04 Apr 2014 08:50:37 +0000
Subject: Re: [PATCH] staging: vme: Simplfy string usage in vme_user_probe()
Message-Id: <533E725D.8090200@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396544171-2458-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1396544171-2458-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


looks good to me

reviewed-by: wharms <wharms@bfs.de>

@Bojan Prtvar:
please note that i am not the maintainer

Am 03.04.2014 18:56, schrieb Bojan Prtvar:
> We can avoid usage of sprintf() and magic-sized array with simple pointer assignment.
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
> This parch should be applied on top of 
> "staging: vme: Fix a small coding style issue in vme_user.c"
> 
> Compile tested only.
> 
>  drivers/staging/vme/devices/vme_user.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
> index 481192a..5fa7f83 100644
> --- a/drivers/staging/vme/devices/vme_user.c
> +++ b/drivers/staging/vme/devices/vme_user.c
> @@ -684,7 +684,7 @@ static int vme_user_match(struct vme_dev *vdev)
>  static int vme_user_probe(struct vme_dev *vdev)
>  {
>  	int i, err;
> -	char name[12];
> +	char *name;
>  
>  	/* Save pointer to the bridge device */
>  	if (vme_user_bridge != NULL) {
> @@ -794,13 +794,13 @@ static int vme_user_probe(struct vme_dev *vdev)
>  
>  		switch (type[i]) {
>  		case MASTER_MINOR:
> -			sprintf(name, "bus/vme/m%%d");
> +			name = "bus/vme/m%d";
>  			break;
>  		case CONTROL_MINOR:
> -			sprintf(name, "bus/vme/ctl");
> +			name = "bus/vme/ctl";
>  			break;
>  		case SLAVE_MINOR:
> -			sprintf(name, "bus/vme/s%%d");
> +			name = "bus/vme/s%d";
>  			break;
>  		default:
>  			err = -EINVAL;
