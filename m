From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Tue, 29 May 2007 13:55:13 +0000
Subject: Re: [KJ] Header files
Message-Id: <alpine.DEB.0.99.0705290950060.2252@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19f34abd0705290051n6fea05d0q67eafb3f5ba1d757@mail.gmail.com>
In-Reply-To: <19f34abd0705290051n6fea05d0q67eafb3f5ba1d757@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > 1) Guard names: There are many possible naming schemes, and the
> > kernel probably uses them all. This, of course, means that there are
> > potentially conflicts between current header files or current and
> > future header files.
> 
> i doubt it's worth trying to do anything about that -- that's the sort
> of thing that will be handled on a case-by-case basis as it comes up.
> i've noticed this before -- no real standard for naming scheme, so i'd
> just let this one go.
> 
> > 2) Self-consistency: A lot of headers are not self-consistent, i.e.
> > they rely on certain headers being included in advance.
> 
> that's a tough call.  i doubt it's worth trying to do anything about
> that if it just involves adding extra includes to a file somewhere.
> however, it would make more sense to have a patch that *moves* an
> include from one file to another more appropriate location, if that's
> possible.
> 
> > Is this worth fixing? (If you can call it fixing. "If it's not
> > broken...") Correcting this would span most of the headers, possibly
> > introducing thousands of lines of patches. I think a lot of people
> > would find it a waste of time and resources; consequently, the
> > changes would be hard to get into the kernel. I'd like to start
> > doing it but won't if it won't be used.
> 
> there's little chance that a change that disruptive would be accepted
> if it wasn't fixing actual breakage.

It's not just about disruption. Even Randy has made comments that changes 
to things that work, even though they're done poorly, won't be accepted, 
even if they are accepted by all the heavy-hitter developers to be The 
Right Thing. They all want to wait until the eventual time that some 
actual functional change is made to code, at which point cosmetic changes 
can be snuck in without significant additional effort, rather like the 
U.S. Congress sneaking in pay raises with hurricane relief measures. 
Unless you get individual architecture or subsystem maintainers to push 
changes themselves through their periodic repository updates, you'll 
unfortunately just be ignored.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
