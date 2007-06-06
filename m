From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 06 Jun 2007 02:58:55 +0000
Subject: Re: [KJ] Re: [PATCH ARRAY_SIZE 1.5/4] Kernel cleanup in drivers/net
Message-Id: <466622EF.5000704@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4665EC50.7070702@gmail.com>
In-Reply-To: <4665EC50.7070702@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Aaron Cripps wrote:
> this patch is just a bit of a treat ... this removes the unneccesary 
> whitespace from
> before newline characters ... this is purely cosmetic.
> Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>
>
>
> diff --git a/drivers/net/irda/actisys-sir.c 
> b/drivers/net/irda/actisys-sir.c
> index 9715ab5..8cacf74 100644
> --- a/drivers/net/irda/actisys-sir.c
> +++ b/drivers/net/irda/actisys-sir.c
> @@ -1,8 +1,8 @@
> /*********************************************************************
> - *               + *
This patch seem to be _really_ damaged. :)
Please test to resend to yourself until the patch is not space-padded or 
damage in any other way. As for now, it can not be patched.

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
