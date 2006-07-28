From: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Date: Fri, 28 Jul 2006 12:43:00 +0000
Subject: Re: [KJ] [patch] fix common mistake in polling loops
Message-Id: <d120d5000607280543u6ca61a7epbb26ef98dafcae18@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
In-Reply-To: <710c0ee0607280128g2d968c49ycff3bac9e073e7fa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zed 0xff <zed.0xff@gmail.com>
Cc: kernel-janitors@osdl.org, linux-kernel@vger.kernel.org

On 7/28/06, Zed 0xff <zed.0xff@gmail.com> wrote:
> @@ -955,11 +956,15 @@ static void psmouse_resync(void *p)
>  * repeat our attempts 5 times, otherwise we may be left out with disabled
>  * mouse.
>  */
> -       for (i = 0; i < 5; i++) {
> +       timeout = jiffies + msecs_to_jiffies(1000);
> +       for (;;) {
>                if (!ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE)) {
>                        enabled = 1;
>                        break;
>                }
> +               if (time_after(timeout, jiffies)) {
> +                       break;
> +               }
>                msleep(200);
>        }
>

NAK. Have you read the comment above (that is partially visible in
your diff)? I do not really care about timeout here, I want my mouse
working.

-- 
Dmitry
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
