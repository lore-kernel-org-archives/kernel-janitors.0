From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sat, 10 Mar 2012 12:45:22 +0000
Subject: Re: [patch] vt: NULL dereference in vt_do_kdsk_ioctl()
Message-Id: <20120310124522.64fc5851@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120310085923.GD4647@elgon.mountain>
In-Reply-To: <20120310085923.GD4647@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, Jovi Zhang <bookjovi@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 10 Mar 2012 11:59:23 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We forgot to set the "key_map" variable here, so it's still NULL.  This
> was introduced recently in 079c9534a9 "vt:tackle kbd_table".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
> index 70d0593..86dd1e3 100644
> --- a/drivers/tty/vt/keyboard.c
> +++ b/drivers/tty/vt/keyboard.c
> @@ -1863,6 +1863,7 @@ int vt_do_kdsk_ioctl(int cmd, struct kbentry __user *user_kbe, int perm,
>  				return -EPERM;
>  			}
>  			key_maps[s] = new_map;
> +			key_map = new_map;
>  			key_map[0] = U(K_ALLOCATED);
>  			for (j = 1; j < NR_KEYS; j++)
>  				key_map[j] = U(K_HOLE);

Eep I thought I got all of those. Well noted

Acked-by: Alan Cox <alan@linux.intel.com>
