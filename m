From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Sat, 18 Feb 2006 04:58:33 +0000
Subject: Re: [KJ][Patch] make storage class first in pwc-kiara.h
Message-Id: <20060217205833.33ac11fd.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11541736360980615=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140174003.7789.14.camel@localhost.localdomain>
In-Reply-To: <1140174003.7789.14.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============11541736360980615==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 18 Feb 2006 14:46:14 +1100 Darren Jenkins\\ wrote:

> On Fri, 2006-02-17 at 08:12 -0800, Randy.Dunlap wrote:
> > On Fri, 17 Feb 2006, Darren Jenkins\ wrote:
> > 
> > > G'day list
> > >
> > > ICC complains about : Remark #82: Storage Class is not First.
> > >
> > > http://linuxicc.sourceforge.net/
> > >
> > > @ line 40 & 41 of pwc-kiara.h.
> > >
> > > The patch below re-orders the modifiers to make extern before const.
> > 
> > Is that a C-language standard requirement?
> > IOW, that would be a reason to make such a change.
> 
> OK I don't have a copy of the standard, but after a hunt through the
> draft copy I was pointed to earlier 
> (http://wwwold.dkuug.dk/jtc1/sc22/open/n2794/)
> I found this under the grammar section.
> (page 400)
> 
> (6.7) declaration-speciﬁers:
> 
> declaration-speciﬁers:
>          storage-class-speciﬁer declaration-speciﬁersopt
>          type-speciﬁer declaration-speciﬁersopt
>          type-qualiﬁer declaration-speciﬁersopt
>          function-speciﬁer declaration-speciﬁersopt
> 
> Which shows (surprisingly) that it isn't a C-standard requirement. 
> (Damn I thought it was)
> 
> So I guess It is only a coding style issue.
> 
> Not putting the storage class specifier first: 
> is confusing; 
> dilutes the logical meaning of the specifier; 
> is only used in 4 files (looking at ICC warnings);
> generates warnings on ICC;
> is safe to re-order in non-pointer declarations.
> 
> So I guess for these reasons the patches should be applied.

OK, thank you for doing that.

---
~Randy

--===============11541736360980615==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11541736360980615==--
