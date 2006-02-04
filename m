From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Sat, 04 Feb 2006 20:43:38 +0000
Subject: Re: [KJ] [PATCH] request_region - arm/mach_footbridge/netwinder-hw.c
Message-Id: <9a8748490602041243r1434c7b9r1dcaa97714c9022a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602041537.32255.ron@rongage.org>
In-Reply-To: <200602041537.32255.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/4/06, Ron Gage <ron@rongage.org> wrote:
> This patch adds return value checking to request_region. No other structural
> changes included... Using kmail->message->insert file to post patch.

One small nit :

> diff -ur linux-2.6.15.orig/arch/arm/mach-footbridge/netwinder-hw.c
> linux-2.6.15/arch/arm/mach-footbridge/netwinder-hw.c
> --- linux-2.6.15.orig/arch/arm/mach-footbridge/netwinder-hw.c   2006-02-04
> 11:00:21.000000000 -0500
> +++ linux-2.6.15/arch/arm/mach-footbridge/netwinder-hw.c        2006-02-04
> 15:33:37.000000000 -0500
> @@ -333,7 +333,12 @@
>   */
>  static void __init wb977_init(void)
>  {
> -       request_region(0x370, 2, "W83977AF configuration");
> +       struct resource *region;

The prefered style for kernel code is that a blank line is placed
between variable declarations and first actual code statement.

> +       region = request_region(0x370, 2, "W83977AF configuration");
[...]

beyond that the patch looks fine to me.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
