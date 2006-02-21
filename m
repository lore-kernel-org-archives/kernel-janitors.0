From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Tue, 21 Feb 2006 23:13:02 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <9a8748490602211513h6e10886y5c44a185e2f7cd1d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/22/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> hi,
>
> this converts fs/proc to kzalloc() usage.
>
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
>
[snip]
>
>  static struct vmcore* __init get_new_element(void)
>  {
> -       struct vmcore *p;
> -
> -       p = kmalloc(sizeof(*p), GFP_KERNEL);
> -       if (p)
> -               memset(p, 0, sizeof(*p));
> -       return p;
> +       return = kzalloc(sizeof(struct vmcore), GFP_KERNEL);

This looks broken - did you even compile test that patch?

Don't you mean :

return kzalloc(sizeof(struct vmcore), GFP_KERNEL);

???

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
