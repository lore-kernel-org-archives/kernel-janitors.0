From: Greg KH <gregkh@suse.de>
Date: Wed, 29 Jul 2009 20:44:09 +0000
Subject: Re: [PATCH 4/4] Staging: hv: Fix warning by casting a (const void
Message-Id: <20090729204409.GA3238@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907291410.29355.npalix@diku.dk>
 <20090729130233.GA27054@suse.de>
 <8AFC7968D54FB448A30D8F38F259C56209A7E5D8@TK5EX14MBXC116.redmond.corp.microsoft.com>
In-Reply-To: <8AFC7968D54FB448A30D8F38F259C56209A7E5D8@TK5EX14MBXC116.redmond.corp.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hank Janssen <hjanssen@microsoft.com>
Cc: Nicolas Palix <npalix@diku.dk>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 29, 2009 at 08:13:56PM +0000, Hank Janssen wrote:
> 
> >On Wed, Jul 29, 2009 at 02:10:28PM +0200, Nicolas Palix wrote:
> >>
> >> Fix compilation warning by casting the const void *Buffer
> >> variable into a void *.
> >>
> >>>
> [....]
> >> Signed-off-by: Nicolas Palix <npalix@diku.dk>
> >> ---
> >>  drivers/staging/hv/Channel.c |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/drivers/staging/hv/Channel.c b/drivers/staging/hv/Channel.c
> >> index 68f3442..854fa30 100644
> >> --- a/drivers/staging/hv/Channel.c
> >> +++ b/drivers/staging/hv/Channel.c
> >> @@ -787,7 +787,7 @@ VmbusChannelSendPacket(
> >>       bufferList[0].Data = &desc;
> >>       bufferList[0].Length = sizeof(VMPACKET_DESCRIPTOR);
> >>
> >> -     bufferList[1].Data = Buffer;
> >> +     bufferList[1].Data = (void *)Buffer;
> >
> >Yeah, I thought about doing this as well, but it's wrong.  If this
> >buffer really isn't being modified, then the Data pointer needs to be
> >const.
> >
> >Or, if the Data pointer really is going to not be const, then the
> >function parameters need to be changed, but that means lots of code
> >needs to be changed.
> >
> >Hank, what do you think is the correct thing to do here?
> >
> >thanks,
> >
> >greg k-h
> 
> I think both will work. At some point in the past for this design was
> To leave open the possibility for having the buffer modified. Right
> Now I am pretty sure that it does not get modified.
> 
> I am not tied to using either void or const. What makes more sense, are
> The kernel guidelines that if it does not get modified to define it as const?

Yes.

But the best thing to do is the other suggestion, convert it to use the
real scatter-gather api, and not duplicate the functionality here.  That
should solve this issue, right?

> The only thing about changing the API signature is that it does trickle into
> A bunch of changes (primarily in Channel.[ch], ChannelInterface.[ch] and RingBuffer.[ch])

Yeah, that's why I didn't think it was a good idea overall to do that.

Oh, the ringbuffer code will eventually need to get removed anyway, the
kernel already has such infrastructure, so it should be used instead.

thanks,

greg k-h
