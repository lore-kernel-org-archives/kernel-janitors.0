From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 19 Nov 2005 15:44:43 +0000
Subject: Re: [KJ] [PATCH] drivers/cdrom/aztcd.c: busy loop updates + error
Message-Id: <29495f1d0511190744k4e585507sdf40dddb86826d3a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437ED2A4.8040308@comhem.se>
In-Reply-To: <437ED2A4.8040308@comhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/18/05, Daniel Marjam=E4ki <daniel.marjamaki@comhem.se> wrote:
>
> Summary of changes:
> * long busy loops now sleeps between each repetition.
> * using jiffies for timeout rather than repetitions.
> * The return code of aztSendCmd is now checked.
>
> Signed-off-by: Daniel Marjam=E4ki
>
> diff -up a/drivers/cdrom/aztcd.c b/drivers/cdrom/aztcd.c
>
> --- a/drivers/cdrom/aztcd.c     2005-11-17 11:39:53.000000000 +0100
> +++ b/drivers/cdrom/aztcd.c     2005-11-19 08:06:18.000000000 +0100
> @@ -179,6 +179,7 @@
>   #include <linux/ioport.h>
>   #include <linux/string.h>
>   #include <linux/major.h>
> +#include <linux/jiffies.h>
>
>   #include <linux/init.h>
>
> @@ -308,7 +309,7 @@ static char aztDiskChanged =3D 1;
>   static char aztTocUpToDate =3D 0;
>
>   static unsigned char aztIndatum;
> -static unsigned long aztTimeOutCount;
> +static unsigned long aztTimeOutCount, aztTimeOut;
>   static int aztCmd =3D 0;
>
>   static DEFINE_SPINLOCK(aztSpin);
> @@ -361,14 +362,14 @@ static int azt_bcd2bin(unsigned char bcd
>   # define OP_OK op_ok()
>   static void op_ok(void)
>   {
> -       aztTimeOutCount =3D 0;
> +       aztTimeOut =3D jiffies + 2;
>         do {
>                 aztIndatum =3D inb(DATA_PORT);
> -               aztTimeOutCount++;
> -               if (aztTimeOutCount >=3D AZT_TIMEOUT) {
> +               if (time_after(jiffies, aztTimeOut)) {
>                         printk("aztcd: Error Wait OP_OK\n");
>                         break;
>                 }
> +               schedule_timeout(1);

Nope, you *must* set the state before calling schedule_timeout. We
have even simplified this further by adding
schedule_timeout_interruptible() and
schedule_timeout_uninterruptible(). Same for all the others.

<snip>

> @@ -520,7 +521,8 @@ static int sendAztCmd(int cmd, struct az
>                params->end.min, params->end.sec, params->end.frame);
>   #endif
>         for (retry =3D 0; retry < AZT_RETRY_ATTEMPTS; retry++) {
> -               aztSendCmd(cmd);
> +               if (aztSendCmd(cmd))
> +                       continue;

Is this fixing a bug you've actually seen? Otherwise you're changing
functionality without a real reason.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
