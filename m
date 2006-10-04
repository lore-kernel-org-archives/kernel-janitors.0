From: "Amit Choudhary" <amit2030@gmail.com>
Date: Wed, 04 Oct 2006 19:46:53 +0000
Subject: Re: [KJ] [PATCH] [RESEND] sound/isa/ad1816a/ad1816a.c: check
Message-Id: <123917630610041246r72b50a5q860752b993ed2b7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061003075607.32837.qmail@web55612.mail.re4.yahoo.com>
In-Reply-To: <20061003075607.32837.qmail@web55612.mail.re4.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/4/06, Dan Carpenter <error27@gmail.com> wrote:
> On 10/4/06, Amit Choudhary <amit2030@gmail.com> wrote:
>
> > +       if(!cfg)
> > +               return -ENOMEM;
>
> There is still a space missing between if and (.

thanks for pointing it out. my mistake. I will send again. sent the
old one by mistake. but atleast got the email client right (sylpheed)
that preserves tab spaces. thanks to randy.

>
>   Wrong:+       if(!cfg)
> Correct:+       if (!cfg)
>
> regards,
> dan carpenter
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
