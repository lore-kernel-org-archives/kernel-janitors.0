From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 06 Jun 2007 03:09:59 +0000
Subject: Re: [KJ] Re: [PATCH ARRAY_SIZE 1/4] kernel 2.6 size macro clean ups
Message-Id: <46662587.3080208@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <465C99C3.4030802@gmail.com>
In-Reply-To: <465C99C3.4030802@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Aaron Cripps wrote:
> this is a simple patch to remove the MAX_SPEEDS macro in favor of the 
> more
> generic ARRAY_SIZE(arr) macro defined in kernel.h
> RE: Forgot the #import <linux/kernel.h> statement. It's there now.
> Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>
>
>
> diff --git a/drivers/net/irda/actisys-sir.c 
> b/drivers/net/irda/actisys-sir.c
> index 9715ab5..44bf0c2 100644
> --- a/drivers/net/irda/actisys-sir.c
> +++ b/drivers/net/irda/actisys-sir.c
> @@ -43,7 +43,7 @@
> #include <linux/module.h>
> #include <linux/delay.h>
> #include <linux/init.h>
> -
> +#include <linux/kernel.h>
The patch is space-padded, please fix your client (or use ex the script 
"sendpatchset") and send again. (The patch seemed correct otherwise)
> #include <net/irda/irda.h>
>
> #include "sir-dev.h"
> @@ -67,8 +67,6 @@ static int actisys_reset(struct sir_dev *);
> /* Note : the 220L doesn't support 38400, but we will fix that below */
> static unsigned baud_rates[] = { 9600, 19200, 57600, 115200, 38400 };
>
> -#define MAX_SPEEDS (sizeof(baud_rates)/sizeof(baud_rates[0]))
> -
Can anyone explain why the number of possible speeds are called 
MAX_SPEEDS? Maybe it should have been NUM_MAX_SPEEDS...

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
