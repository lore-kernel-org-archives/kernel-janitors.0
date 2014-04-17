From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Thu, 17 Apr 2014 15:55:20 +0000
Subject: Re: [PATCH 35/35] Staging:dgap:dgap_tty.c: Upgraded driver to use Mutex instead of semaphore
Message-Id: <534FF93C.2080405@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1397749881-21193-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1397749881-21193-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>, gregkh@linuxfoundation.org, lidza.louina@gmail.com
Cc: driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi All,

Please ignore this patch. I'm sending with correct Subject Line
On Thursday 17 April 2014 09:21 PM, Kumar Gaurav wrote:
> dgap driver uses semaphore for obtaining lock. I upgraded it to use MUTEX.
>
> Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
> ---
>   drivers/staging/dgap/dgap_tty.c |   17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/dgap/dgap_tty.c b/drivers/staging/dgap/dgap_tty.c
> index 2a7a372..0ca72a2 100755
> --- a/drivers/staging/dgap/dgap_tty.c
> +++ b/drivers/staging/dgap/dgap_tty.c
> @@ -52,7 +52,7 @@
>   #include <asm/uaccess.h>	/* For copy_from_user/copy_to_user */
>   #include <asm/io.h>		/* For read[bwl]/write[bwl] */
>   #include <linux/pci.h>
> -
> +#include<linux/mutex.h>
>   #include "dgap_driver.h"
>   #include "dgap_tty.h"
>   #include "dgap_types.h"
> @@ -61,18 +61,12 @@
>   #include "dgap_conf.h"
>   #include "dgap_sysfs.h"
>   
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)
> -#define init_MUTEX(sem)         sema_init(sem, 1)
> -#define DECLARE_MUTEX(name)     \
> -        struct semaphore name = __SEMAPHORE_INITIALIZER(name, 1)
> -#endif
> -
>   /*
>    * internal variables
>    */
>   static struct board_t	*dgap_BoardsByMajor[256];
>   static uchar		*dgap_TmpWriteBuf = NULL;
> -static DECLARE_MUTEX(dgap_TmpWriteSem);
> +static DEFINE_MUTEX(dgap_TmpWriteSem);
>   
>   /*
>    * Default transparent print information.
> @@ -2004,12 +1998,11 @@ static int dgap_tty_write(struct tty_struct *tty, const unsigned char *buf, int
>   		 * the board.
>   		 */
>   		/* we're allowed to block if it's from_user */
> -		if (down_interruptible(&dgap_TmpWriteSem)) {
> +		if (mutex_lock_interruptible(&dgap_TmpWriteSem))
>   			return (-EINTR);
> -		}
>   
>   		if (copy_from_user(dgap_TmpWriteBuf, (const uchar __user *) buf, count)) {
> -			up(&dgap_TmpWriteSem);
> +			mutex_unlock(&dgap_TmpWriteSem);
>   			printk("Write: Copy from user failed!\n");
>   			return -EFAULT;
>   		}
> @@ -2093,7 +2086,7 @@ static int dgap_tty_write(struct tty_struct *tty, const unsigned char *buf, int
>   
>   	if (from_user) {
>   		DGAP_UNLOCK(ch->ch_lock, lock_flags);
> -		up(&dgap_TmpWriteSem);
> +		mutex_unlock(&dgap_TmpWriteSem);
>   	}
>   	else {
>   		DGAP_UNLOCK(ch->ch_lock, lock_flags);

