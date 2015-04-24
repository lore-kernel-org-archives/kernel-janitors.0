From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 24 Apr 2015 10:29:43 +0000
Subject: Re: [PATCH] fs/compat: remove redundant 'less than zero' check
Message-Id: <alpine.DEB.2.10.1504241228220.3424@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-468999738-1429871383=:3424"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429870070-30310-1-git-send-email-firogm@gmail.com> <alpine.DEB.2.10.1504241209450.3424@hadrien> <CAOXNuu2VKCWNSiePoSw4-G3TqxpXDE9fR75B75-fhQLa-SPcJg@mail.gmail.com>
In-Reply-To: <CAOXNuu2VKCWNSiePoSw4-G3TqxpXDE9fR75B75-fhQLa-SPcJg@mail.gmail.com>
To: Firo Yang <firogm@gmail.com>
Cc: viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-468999738-1429871383=:3424
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 24 Apr 2015, Firo Yang wrote:

> It was because that1. nr_segs stand for the number of 'segs' should be large
> or equal to 0, a positive number.

This is not very convincing.  A negative number could be used to encode a
failure of some previous operation, although normally that failure should
have been checked for elsewhere.

> 2. the type of nr_segs is 'unsigned long', It imply a positive number.

OK, this seems like a reasonable explanation.  Currently the test can
never be true, so there is no point to have it.  It would be good to note
this in the commit message of your patch.

julia

> 3. the code if (nr_segs > UIO_MAXIOV) is enough to keep the value nr_segs
> safe.
>
> Regards
> Firo
>
>
>
> On Fri, Apr 24, 2015 at 6:10 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
>
>
>       On Fri, 24 Apr 2015, Firo Yang wrote:
>
>       > Smatch complains about the check in compat.c.
>       > fs/compat.c:565 compat_rw_copy_check_uvector() warn:
>       > unsigned 'nr_segs' is never less than zero.
>       >
>       > I think, there is no reason to check if the value nr_segs
>       > is less than zero. So I removed it.
>
>       It would be good to explain why you think this.  What other
>       statements in
>       the code imply this property?
>
>       julia
>
>       >
>       > Signed-off-by: Firo Yang <firogm@gmail.com>
>       > ---
>       >  fs/compat.c | 2 +-
>       >  1 file changed, 1 insertion(+), 1 deletion(-)
>       >
>       > diff --git a/fs/compat.c b/fs/compat.c
>       > index 6fd272d..beaf15b 100644
>       > --- a/fs/compat.c
>       > +++ b/fs/compat.c
>       > @@ -562,7 +562,7 @@ ssize_t compat_rw_copy_check_uvector(int
>       type,
>       >               goto out;
>       >
>       >       ret = -EINVAL;
>       > -     if (nr_segs > UIO_MAXIOV || nr_segs < 0)
>       > +     if (nr_segs > UIO_MAXIOV)
>       >               goto out;
>       >       if (nr_segs > fast_segs) {
>       >               ret = -ENOMEM;
>       > --
>       > 2.1.0
>       >
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
>
>
>
--8323329-468999738-1429871383=:3424--
