From: Joe Perches <joe@perches.com>
Date: Tue, 12 May 2020 16:23:45 +0000
Subject: Re: MAINTAINERS: Wrong ordering in VIRTIO BALLOON
Message-Id: <80146d5713f8579a92b4da1e2b7d7626999dd9be.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005120717260.3701@felia>
         <bb2eea77-72df-6c53-5397-de057ffc9dd8@redhat.com>
In-Reply-To: <bb2eea77-72df-6c53-5397-de057ffc9dd8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On Tue, 2020-05-12 at 08:38 +0200, David Hildenbrand wrote:
> On 12.05.20 07:21, Lukas Bulwahn wrote:
> > Hi David,
> > 
> > with your commit 6d6b93b9afd8 ("MAINTAINERS: Add myself as virtio-balloon 
> > co-maintainer"), visible on next-20200508, ./scripts/checkpatch.pl -f 
> > MAINTAINERS complains:
> > 
> > WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
> > #17982: FILE: MAINTAINERS:17982:
> > +F:	include/uapi/linux/virtio_balloon.h
> > +F:	include/linux/balloon_compaction.h
> > 
> > This is due to wrong ordering of the entries in your submission. If you 
> > would like me to send you a patch fixing that, please just let me know.
> > 
> > It is a recent addition to checkpatch.pl to report ordering problems in 
> > MAINTAINERS, so you might have not seen that at submission time.
> 
> Thanks for the notification Lukas,
> 
> b962ee8622d0 ("checkpatch: additional MAINTAINER section entry ordering
> checks") is not in Linus' tree yet AFAIKS.
> 
> I can see that 3b50142d8528 ("MAINTAINERS: sort field names for all
> entries") is upstream. I do wonder if we should just do another batch
> update after the checkpatch patch is upstream instead, I guess more will
> pile up?
> 
> @mst, joe, what do you prefer?
> 
> 1. I can resend the original patch.
> 2. Lukas can send a fixup that we might want to squash.
> 3. We wait until the checkpatch change goes upstream and to a final
> batch update.

A fixup patch would work.

I think if Linus every once in awhile just before an -rc1 runs
scripts/parse-maintainers like:

commit 3b50142d8528 ("MAINTAINERS: sort field names for all entries")

then these sorts of individual patches would not matter much.

This first time the script was run, I think there was just 1 patch
conflict from -next to Linus' tree, and that scripted change was
fairly large.

As the changes will generally be smaller in the future, it's unlikely
there will be a significant number of conflicts.
