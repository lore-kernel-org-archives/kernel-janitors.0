From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 14 Dec 2004 16:38:52 +0000
Subject: Re: [KJ] bitkeeper tree for kjt patchset?
Message-Id: <41BF171C.4070809@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1103041747.8263.16.camel@localhost.localdomain>
In-Reply-To: <1103041747.8263.16.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Gustavo Franco wrote:
> What do you think of a bk repository for kjt? I did a search and i
> didn't see anything related with this topic, am i missing something ?

IMO the maintainer should use whatever s/he feels is the best
tool for the job, whichever it is.

> Reading all recent -mm announces we see that Andrew is merging acpi,
> agpgart, arm, cifs and others bk trees. I think that he can merge bk-kjt
> too and we'll see more testing of these patches posted at this list. 

Andrew can and will merge non-bk patchsets also (such as those
made with quilt or (his) patch-scripts), but he considers KJ patchsets
too risky IIRC.  I may or may not be able to find the email on
that subject/discussion.  You or someone can ask him again, of course.

> Actually, the kjt 'release process' is post the patchset to lkml when
> kjt maintainer feels that it's ok, no? IMO, it can be done the same way
> but asking for Andrew merge bk-kjt before release -mm kernels adding
> there (bk-kjt) only reviewed patches posted at this list. Comments?
> 
> If you think that it's a good idea and there's no server to setup it
> (and i guess that bkbits won't be a problem), i can host it atm.

Please keep in mind that patchsets should still be available as
a tarball (IMO of course, but when Linus started using BK, it was
with the understanding that no one is _required_ to use BK, that
there would be alternative methods of getting the source).
So if cloning a KJ BK tree was required, I would never do it.
I just want tarballs -- which doesn't prevent the use of BK
by the KJ maintainer.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
