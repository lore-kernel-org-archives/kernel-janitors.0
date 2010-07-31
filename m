From: Dan Carpenter <error27@gmail.com>
Date: Sat, 31 Jul 2010 19:09:08 +0000
Subject: Re: [PATCH 1/7] 68328serial: check return value of copy_*_user()
Message-Id: <20100731190907.GE26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280597881-8365-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280597881-8365-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Christoph Egger <siccegge@cs.fau.de>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

On Sat, Jul 31, 2010 at 09:38:00PM +0400, Kulikov Vasiliy wrote:
> -						sizeof(struct m68k_serial)))
> -				return -EFAULT;
> -			copy_to_user((struct m68k_serial *) arg,
> +			return copy_to_user((struct m68k_serial *) arg,
>  				    info, sizeof(struct m68k_serial));

We should return if -EFAULT copy_to_user() failes here.

> -			return 0;
> -			
>  		default:
>  			return -ENOIOCTLCMD;
>  		}

Smatch would have caught that but I don't have a cross compile
environment set up.

regards,
dan carpenter
