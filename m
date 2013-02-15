From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 15 Feb 2013 08:50:08 +0000
Subject: Re: Kernel janitors website?
Message-Id: <alpine.DEB.2.02.1302150946540.1978@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87d2w2u5qv.fsf@steelpick.2x.cz>
In-Reply-To: <87d2w2u5qv.fsf@steelpick.2x.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 15 Feb 2013, Dan Carpenter wrote:

> On Thu, Feb 14, 2013 at 07:09:44PM +0100, Michal Sojka wrote:
> > Hello,
> > 
> > we are running a university course [1] (in Czech) about working with
> > open source communities. We try to help students with finding tasks and
> > projects to work on. Do you have a web site listing the possible tasks
> > for students?
> > 
> > It used to be http://janitor.kernelnewbies.org/ but it seems to be dead.
> > Other pages http://kernelnewbies.org/KernelJanitors/Todo,
> > https://code.google.com/p/kernel-janitors/wiki/TODO seem to be outdated.
> 
> Most of these still apply.
> 
> There is always stuff to fix in staging.  The thing about staging
> though is that fixing style issues are fairly boring for students.
> Also kernel style guidelines are very involved and we tend to be
> stricter about pure style fixes than we are about bug fixes.

Actually, I had thought that staging would be good for students,  They 
could do simple things, and not run into the problem of annoying a 
maintainer who is overwhelmed with real problems with trivial things.

The problem with staging though is that it is not so clear what files 
people are actually interested in.  Because it would be very discouraging 
for students to send patches and have them all ignored.  I had suggested 
to just use git to see which files had received the most commits recently, 
but perhaps there is a better strategy.

julia

> What I sometimes do is review short fixes and find similar bugs.
> 
> git checkout v3.3
> 
> git log --oneline v3.3-rc3..v3.3 | while read hash ; do
> 	if ! git show $hash | diffstat -l | grep -q "\.c$" ; then
> 		continue
> 	fi
> 	lines=$(git show $hash | diffstat | tail -n 1 | cut -d ' ' -f 5)
> 	echo $lines $hash
> done | sort -n | cut -d ' ' -f 2 | tee hashes
> 
> for i in $(cat hashes) ; do
> 	git show $i
> done | less
> 
> A lot of kernel janitor patches these days are static analysis
> fixes.  I'm using Smatch.  A bunch of people are doing things with
> Coccinelle.  I think Peter is using clang.  I think there are many
> clang warnings left though.
> 
> I think as well, that you would find more warnings on non-x86
> arches.
> 
> You could try asking for ideas on lkml.  We're always interested in
> ideas as well.  Describe how long you'd want a typical project to
> take.
> 
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
