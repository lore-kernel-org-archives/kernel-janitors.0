From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 29 Sep 2006 13:16:40 +0000
Subject: Re: [KJ] [PATCH] check return code for request_region() in
Message-Id: <9a8748490609290616t389593afme3b5a5c70981933c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060928103514.GA12240@localhost.localdomain>
In-Reply-To: <20060928103514.GA12240@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 29/09/06, Hashem Masoud <masoudh@batelco.com.bh> wrote:
> Jesper Juhl wrote:
>
> >> +++ linux/sound/oss/gus_wave.c  2006-09-28 20:17:41.093694160 -0300
> >> @@ -2938,7 +2938,10 @@ void __init gus_wave_init(struct address
> >>                         model_num = "3.7";
> >>                         gus_type = 0x37;
> >>                         mixer_type = ICS2101;
> >> -                       request_region(u_MixSelect, 1, "GUS mixer");
> >> +                       if !(request_region(u_MixSelect, 1, "GUS
> >> mixer")) {
> >
> >
> > ... and it shows ^^^^^
>
> BTW, Google web mail access automatically translates tabs into spaces, but if you download your e-mails using POP access this won't happen.

I'm quite aware of that. That's not what I was talking about, and btw,
you'll notice that any mails I send with patches I do *not* send via
the gmail webinterface...

Now, what I *was* talking about was this bit of your patch:  "if
!(request_region"
That should have been  "if (!request_region"


> Also, check the patch posted to list, it is intact:

Again, that's not what I was talking about..


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
