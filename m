From: Domen Puncer <domen@coderock.org>
Date: Thu, 30 Jun 2005 13:48:45 +0000
Subject: Re: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for non
Message-Id: <20050630134845.GA16115@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============04570547967351013=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622194756.GA6699@dansme-mobile.smertnig>
In-Reply-To: <20050622194756.GA6699@dansme-mobile.smertnig>
To: kernel-janitors@vger.kernel.org

--===============04570547967351013==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 30/06/05 15:01 +0200, Daniel Smertnig wrote:
> On 6/29/05, Domen Puncer <domen@coderock.org> wrote:
> > On 22/06/05 21:47 +0200, Daniel Smertnig wrote:
> > > diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
> > > --- a/drivers/char/amiserial.c
> > > +++ b/drivers/char/amiserial.c
> > > @@ -1876,6 +1876,17 @@ static inline int line_info(char *buf, s
> > >               info->quot = 0;
> > >               info->tty = NULL;
> > >       }
> > > +
> > > +     if (info->quot) {
> > > +             ret += sprintf(buf+ret, " baud:%d",
> > > +                            state->baud_base / info->quot);
> > > +     }
> > > +
> > > +     if (!capable(CAP_SYS_RAWIO)) {
> > > +             strcat(buf, "\n");
> > > +             return ret + 1;
> > 
> > So... we overwrite first two bytes, and then return the whole string?
> > Or am I missing something?
> 
> I don't see any problem here? A newline is appended to the string and
> the total length of the string (previous length "ret" + 1 for the
> newline) is returned.

Ahh... I think I get your intent.
That should be  strcat(buf+ret, "\n"); , right?

> 
> > > +     }
> > > +
> > 
> >    ^^ you introduce whitespace.
> 
> Sorry, i will resend with that fixed
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04570547967351013==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============04570547967351013==--
