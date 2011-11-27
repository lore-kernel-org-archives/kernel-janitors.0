From: Greg KH <greg@kroah.com>
Date: Sun, 27 Nov 2011 01:58:22 +0000
Subject: Re: [PATCH 1/2] drivers/staging/vt6656/iwctl.c: Change PRINT_K and
Message-Id: <20111127015822.GE27297@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320871033-2672-1-git-send-email-marcos.mage@gmail.com>
In-Reply-To: <1320871033-2672-1-git-send-email-marcos.mage@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 09, 2011 at 06:37:13PM -0200, Marcos Paulo de Souza wrote:
> As asked in the TODO file of this driver, the PRINTK and DBG_PRT macros
> must be removed. The debug messages was improved too.
> 
> Signed-off-by: Marcos Paulo de Souza <marcos.mage@gmail.com>
> ---
>  drivers/staging/vt6656/iwctl.c |  135 ++++++++++++++++++++--------------------
>  1 files changed, 67 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/staging/vt6656/iwctl.c b/drivers/staging/vt6656/iwctl.c
> index 2121205..8c1ca49 100644
> --- a/drivers/staging/vt6656/iwctl.c
> +++ b/drivers/staging/vt6656/iwctl.c
> @@ -68,7 +68,6 @@ static const long frequency_list[] = {
>  
>  
>  //static int          msglevel                =MSG_LEVEL_DEBUG;
> -static int          msglevel                =MSG_LEVEL_INFO;
>  
>  
>  /*---------------------  Static Variables  --------------------------*/
> @@ -110,7 +109,7 @@ static int iwctl_commit(struct net_device *dev,
>  			      void *wrq,
>  			      char *extra)
>  {
> -    DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO " SIOCSIWCOMMIT\n");
> +	pr_debug(" SIOCSIWCOMMIT\n");

Stuff like this isn't even needed anymore.

And again, please use dev_dbg(), not pr_debug().

thanks,

greg k-h
