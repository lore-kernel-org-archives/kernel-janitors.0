From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 16 Jan 2004 22:10:59 +0000
Subject: Re: [Kernel-janitors]  [patch 2.6.1] audit *_user, get rid of
Message-Id: <20040116141059.5f066b73.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Jan 2004 22:45:32 +0100 Domen Puncer <domen@coderock.org> wrote:

| Hi.
| 
| To be aplied on top of CONFIG_LEDMAN patch, or you'll get -11 lines offsets.
| 
| I left one copy_*_user, because locking needs to be fixed around it too.
| About that s/break/return/ in switch: at end of switch there is a "return 0".
| Didn't compile test it, since it's a motorola driver.
| 
| 
| 	Domen
| 
| --- c/drivers/serial/mcfserial.c	2004-01-16 22:28:31.000000000 +0100
| +++ a/drivers/serial/mcfserial.c	2004-01-16 22:40:44.000000000 +0100
|  		case TIOCSERGSTRUCT:
| -			error = verify_area(VERIFY_WRITE, (void *) arg,
| -						sizeof(struct mcf_serial));
| -			if (error)
| -				return error;
| -			copy_to_user((struct mcf_serial *) arg,
| -				    info, sizeof(struct mcf_serial));
| -			return 0;
| +			if (copy_to_user((struct mcf_serial *) arg,
| +				    info, sizeof(struct mcf_serial)))
| +			return -EFAULT;

what if copy_to_user() above returns 0?
is it supposed to fall through?

rest of it looks fine.
Please fix & resend (unless it's correct as is)

|  		case TIOCMGET:
| -			if ((error = verify_area(VERIFY_WRITE, (void *) arg,
| -                            sizeof(unsigned int))))
| -                                return(error);
|  			val = mcfrs_getsignals(info);
| -			put_user(val, (unsigned int *) arg);
| -			break;
| +			return put_user(val, (unsigned int *) arg);
|  


--
~Randy
Everything is relative.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
