From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Thu, 30 Jun 2005 13:01:57 +0000
Subject: Re: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for non
Message-Id: <18dd01ff05063006017f102eb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622194756.GA6699@dansme-mobile.smertnig>
In-Reply-To: <20050622194756.GA6699@dansme-mobile.smertnig>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/29/05, Domen Puncer <domen@coderock.org> wrote:
> On 22/06/05 21:47 +0200, Daniel Smertnig wrote:
> > diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
> > --- a/drivers/char/amiserial.c
> > +++ b/drivers/char/amiserial.c
> > @@ -1876,6 +1876,17 @@ static inline int line_info(char *buf, s
> >               info->quot = 0;
> >               info->tty = NULL;
> >       }
> > +
> > +     if (info->quot) {
> > +             ret += sprintf(buf+ret, " baud:%d",
> > +                            state->baud_base / info->quot);
> > +     }
> > +
> > +     if (!capable(CAP_SYS_RAWIO)) {
> > +             strcat(buf, "\n");
> > +             return ret + 1;
> 
> So... we overwrite first two bytes, and then return the whole string?
> Or am I missing something?

I don't see any problem here? A newline is appended to the string and
the total length of the string (previous length "ret" + 1 for the
newline) is returned.

> > +     }
> > +
> 
>    ^^ you introduce whitespace.

Sorry, i will resend with that fixed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
