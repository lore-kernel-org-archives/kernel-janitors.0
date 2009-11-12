From: Julia Lawall <julia@diku.dk>
Date: Thu, 12 Nov 2009 14:57:14 +0000
Subject: Re: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk>
 <alpine.LRH.2.00.0911121857110.31071@tundra.namei.org> <20091112145314.GA24682@us.ibm.com>
In-Reply-To: <20091112145314.GA24682@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: James Morris <jmorris@namei.org>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 12 Nov 2009, Serge E. Hallyn wrote:

> Quoting James Morris (jmorris@namei.org):
> > On Thu, 12 Nov 2009, Julia Lawall wrote:
> > 
> > > From: Julia Lawall <julia@diku.dk>
> > > 
> > > As observed by Joe Perches, sizeof of a constant string includes the
> > > trailing 0.  If what is wanted is to check the initial characters of
> > > another string, this trailing 0 should not be taken into account.  If an
> > > exact match is wanted, strcmp should be used instead.
> > 
> > > --- a/security/selinux/hooks.c
> > > +++ b/security/selinux/hooks.c
> > > @@ -448,7 +448,7 @@ static int sb_finish_set_opts(struct sup
> > >  		sbsec->flags &= ~SE_SBLABELSUPP;
> > >  
> > >  	/* Special handling for sysfs. Is genfs but also has setxattr handler*/
> > > -	if (strncmp(sb->s_type->name, "sysfs", sizeof("sysfs")) = 0)
> > > +	if (strncmp(sb->s_type->name, "sysfs", sizeof("sysfs") - 1) = 0)
> > >  		sbsec->flags |= SE_SBLABELSUPP;
> > 
> > Shouldn't this be a simple strcmp() ?
> 
> Yes I think so.
> 
> Julia seems to be arguing that if a module introduces a new fs with
> name 'sysfs_foo' then this check should match that fs too (since
> for sysfs, sb->s_type->name = "sysfs" which also has a trailing \0,
> so for the regular sysfs her patch makes no practical difference).

If strcmp is what is wanted, I can make a patch for that.

julia
