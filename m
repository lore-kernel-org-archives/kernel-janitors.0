From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 25 Jul 2019 11:34:38 +0000
Subject: Re: [PATCH 1/2] string: Add stracpy and stracpy_pad mechanisms
Message-Id: <alpine.DEB.2.21.1907250632500.2535@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2088688034-1564054482=:2535"
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <e3a37d93-0353-ebed-948a-991add184616@web.de>
In-Reply-To: <e3a37d93-0353-ebed-948a-991add184616@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2088688034-1564054482=:2535
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 25 Jul 2019, Markus Elfring wrote:

> > New version.  I check for non-use of the return value of strlcpy and
> > address some issues that affected the matching of the case where the first
> > argument involves a pointer dereference.
>
> I suggest to take another look at corresponding implementation details
> of the shown SmPL script.
>
>
> > \(strscpy\|strlcpy\)(e1.f, e2, i2)@p
>
> Can the data access operator “->” (arrow) matter also here?

What did my email say about isomorphisms?

>
>
> > @@
> > identifier r.i1,r.i2;
> > type T;
> > @@
> > struct i1 { ... T i1[i2]; ... }
>
> Will an additional SmPL rule name be helpful for this part?

Yes, sorry, it would seem that that is necessary.  I will fix and resend
the results.

>
>
> > @@
> > (
> > -x = strlcpy
> > +stracpy
> >   (e1.f, e2
> > -    , i2
> >   )@p;
> >   ... when != x
> >
> > |
>
> I wonder about the deletion of the assignment target.
> Should the setting of such a variable be usually preserved?

If it is a local variable and never subsequently used, it doesn't seem
very useful.

julia
--8323329-2088688034-1564054482=:2535--
