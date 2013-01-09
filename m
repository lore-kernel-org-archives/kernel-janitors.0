From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 09 Jan 2013 13:27:29 +0000
Subject: Re: [patch 2/2] staging: sb105x: clean up interface type test
Message-Id: <1357738049.5190.51.camel@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130109071214.GC2454@elgon.mountain>
In-Reply-To: <20130109071214.GC2454@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2013-01-09 at 10:12 +0300, Dan Carpenter wrote:
> IIR_RS232 is zero so "if (IIR_RS232 = (b_ret & IIR_RS232))" is always
> true so RS232 was always chosen by default.  The test should be
> "if (0 = (b_ret & 0x30)) { ".  The other tests should also be in that
> format.

Wow, this code really does need major luving ;-)

> 
> My patch doesn't change how the code works.  I've left the RS232 as the
> default and cleaned up the other checks.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/sb105x/sb_mp_register.h b/drivers/staging/sb105x/sb_mp_register.h
> index 5480ae1..a2087f5 100644
> --- a/drivers/staging/sb105x/sb_mp_register.h
> +++ b/drivers/staging/sb105x/sb_mp_register.h
> @@ -45,7 +45,7 @@
>  #define IIR_RS232		0x00		/* RS232 type */
>  #define IIR_RS422		0x10		/* RS422 type */
>  #define IIR_RS485		0x20		/* RS485 type */
> -#define IIR_UNKNOWN		0x30		/* unknown type */
> +#define IIR_TYPE_MASK		0x30
>  
>  /* Interrrupt Mask Register */
>  #define MP_OPTR_IMR0		0x0C 	/* port0 ~ port8 */
> diff --git a/drivers/staging/sb105x/sb_pci_mp.c b/drivers/staging/sb105x/sb_pci_mp.c
> index 131afd0c..3da44df 100644
> --- a/drivers/staging/sb105x/sb_pci_mp.c
> +++ b/drivers/staging/sb105x/sb_pci_mp.c
> @@ -2851,18 +2851,12 @@ static void __init multi_init_ports(void)
>  				printk("IIR_RET = %x\n",b_ret);
>  			}
>  
> -			if(IIR_RS232 = (b_ret & IIR_RS232))
> -			{
> -				mtpt->interface = RS232;
> -			}
> -			if(IIR_RS422 = (b_ret & IIR_RS422))
> -			{
> +			/* default to RS232 */
> +			mtpt->interface = RS232;
> +			if (IIR_RS422 = (b_ret & IIR_TYPE_MASK))
>  				mtpt->interface = RS422PTP;
> -			}
> -			if(IIR_RS485 = (b_ret & IIR_RS485))
> -			{
> +			if (IIR_RS485 = (b_ret & IIR_TYPE_MASK))
>  				mtpt->interface = RS485NE;
> -			}

Hmm, I don't know the specs of this driver. But this does change the
code on what interface is set. The old code would have 0x30 set
interface to RS485NE, where this code would keep it at RS232.

Maybe I can dig up some specs someplace.

-- Steve


>  		}
>  	}
>  }


