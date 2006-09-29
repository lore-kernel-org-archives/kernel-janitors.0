From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 29 Sep 2006 00:08:57 +0000
Subject: Re: [KJ] [PATCH] check return code for request_region() in
Message-Id: <9a8748490609281708p2708a481j66b2443e15710dd7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060928103514.GA12240@localhost.localdomain>
In-Reply-To: <20060928103514.GA12240@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 29/09/06, Hashem Masoud <masoudh@batelco.com.bh> wrote:
> Thanks for your directions. The following is the newest attempt (sorry,
> without compilation as my time is short!)
>

If you don't even have time to test compile your changes then you are
in too much of a hurry ...

> Signed-off-by: Hashem Masoud <masoudh@batelco.com.bh>
> ---
>  gus_wave.c |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> ---
> diff -urp linux-2.6.17.13/sound/oss/gus_wave.c linux/sound/oss/gus_wave.c
> --- linux-2.6.17.13/sound/oss/gus_wave.c        2006-09-27 19:03:42.000000000 -0300
> +++ linux/sound/oss/gus_wave.c  2006-09-28 20:17:41.093694160 -0300
> @@ -2938,7 +2938,10 @@ void __init gus_wave_init(struct address
>                         model_num = "3.7";
>                         gus_type = 0x37;
>                         mixer_type = ICS2101;
> -                       request_region(u_MixSelect, 1, "GUS mixer");
> +                       if !(request_region(u_MixSelect, 1, "GUS mixer")) {

 ... and it shows ^^^^^

Please take the time to do minimal testing. Not doing so is a waste of
a lot of peoples time.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
