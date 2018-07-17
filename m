From: Richard Guy Briggs <rgb@redhat.com>
Date: Tue, 17 Jul 2018 21:30:23 +0000
Subject: Re: [bug report] netlink: have netlink per-protocol bind function return an error code.
Message-Id: <20180717213023.u6eirfr5mqyu3vw7@madcap2.tricolour.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180621135054.abihwzh2j6e46zgl@kili.mountain>
In-Reply-To: <20180621135054.abihwzh2j6e46zgl@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2018-06-25 12:05, Richard Guy Briggs wrote:
> On 2018-06-21 16:50, Dan Carpenter wrote:
> > Hello Richard Guy Briggs,
> 
> Hi Dan,

Hi Dan,

> > This is a semi-automatic email about new static checker warnings.
> 
> Thanks for the report.  I'll have a closer look when I've got a chance,
> but I see the point.  I don't know if it is possible off the top of my
> head.

Ok, having a closer look, git blame from before that patch shows the
same logic, so it appears I didn't change whether or not this is a bug.

Digging a bit deeper, the original netlink_alloc_groups() was called if
nladdr->nl_groups was non-zero to create nlk->groups, and groups is set
to nladdr->nl_groups.  After the rename, netlink_realloc_groups()
creates it regardless, so this looks safe.

> 
> > The patch 4f520900522f: "netlink: have netlink per-protocol bind 
> > function return an error code." from Apr 22, 2014, leads to the 
> > following Smatch complaint:
> > 
> >     net/netlink/af_netlink.c:1056 netlink_bind()
> >      error: we previously assumed 'nlk->groups' could be null (see line 1049)
> > 
> > net/netlink/af_netlink.c
> >   1048	
> >   1049		if (!groups && (nlk->groups = NULL || !(u32)nlk->groups[0]))
> >                     ^^^^^^^
> > 
> >   1050			goto unlock;
> >   1051		netlink_unlock_table();
> >   1052	
> >   1053		netlink_table_grab();
> >   1054		netlink_update_subscriptions(sk, nlk->subscriptions +
> >   1055						 hweight32(groups) -
> >   1056						 hweight32(nlk->groups[0]));
> >                                                            ^^^^^^^^^^^^^^
> > Say groups is non-NULL and nlk->groups is NULL then this would be an
> > issue.  Is that possible?  I don't know why Smatch is just now suddenly
> > complaining about a 4 year old patch.
> > 
> >   1057		nlk->groups[0] = (nlk->groups[0] & ~0xffffffffUL) | groups;
> >   1058		netlink_update_listeners(sk);
> > 
> > regards,
> > dan carpenter
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635
