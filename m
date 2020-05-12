From: David Hildenbrand <david@redhat.com>
Date: Tue, 12 May 2020 06:38:11 +0000
Subject: Re: MAINTAINERS: Wrong ordering in VIRTIO BALLOON
Message-Id: <bb2eea77-72df-6c53-5397-de057ffc9dd8@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005120717260.3701@felia>
In-Reply-To: <alpine.DEB.2.21.2005120717260.3701@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On 12.05.20 07:21, Lukas Bulwahn wrote:
> Hi David,
> 
> with your commit 6d6b93b9afd8 ("MAINTAINERS: Add myself as virtio-balloon 
> co-maintainer"), visible on next-20200508, ./scripts/checkpatch.pl -f 
> MAINTAINERS complains:
> 
> WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
> #17982: FILE: MAINTAINERS:17982:
> +F:	include/uapi/linux/virtio_balloon.h
> +F:	include/linux/balloon_compaction.h
> 
> This is due to wrong ordering of the entries in your submission. If you 
> would like me to send you a patch fixing that, please just let me know.
> 
> It is a recent addition to checkpatch.pl to report ordering problems in 
> MAINTAINERS, so you might have not seen that at submission time.

Thanks for the notification Lukas,

b962ee8622d0 ("checkpatch: additional MAINTAINER section entry ordering
checks") is not in Linus' tree yet AFAIKS.

I can see that 3b50142d8528 ("MAINTAINERS: sort field names for all
entries") is upstream. I do wonder if we should just do another batch
update after the checkpatch patch is upstream instead, I guess more will
pile up?

@mst, joe, what do you prefer?

1. I can resend the original patch.
2. Lukas can send a fixup that we might want to squash.
3. We wait until the checkpatch change goes upstream and to a final
batch update.

-- 
Thanks,

David / dhildenb
