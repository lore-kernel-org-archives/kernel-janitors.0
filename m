From: James Lamanna <jlamanna@gmail.com>
Date: Tue, 04 Jan 2005 23:01:38 +0000
Subject: [KJ] Re: isdn_bsdcomp.c - vfree() checking cleanups
Message-Id: <aa4c40ff0501041501601b9151@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46343844940460266=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050104224729.GB3496@nd47.coderock.org>
In-Reply-To: <20050104224729.GB3496@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============46343844940460266==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Oh wow.
I must have missed that strangeness.
I'll send new ones shortly.


On Tue, 4 Jan 2005 23:47:29 +0100, Domen Puncer <domen@coderock.org> wrote:
> On 04/01/05 13:56 -0800, jlamanna@gmail.com wrote:
> > -             if (db->dict) {
> > -                     vfree (db->dict);
> > -                     db->dict -              }
> > +             vfree (db->dict);
> > +             db->dict
> 
> Khm... mailer problems with '='?
> Please fix this (encoding settings?) and resend.
> Also: you can test your mail is fine by sending it to youself and
> feeding it to `patch`.
> 
> Other than this, patches look fine to me.
> 
> 
>         Domen
>

--===============46343844940460266==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46343844940460266==--
