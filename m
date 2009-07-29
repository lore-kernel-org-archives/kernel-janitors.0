From: Greg KH <gregkh@suse.de>
Date: Wed, 29 Jul 2009 13:02:33 +0000
Subject: Re: [PATCH 4/4] Staging: hv: Fix warning by casting a (const void
Message-Id: <20090729130233.GA27054@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907291410.29355.npalix@diku.dk>
In-Reply-To: <200907291410.29355.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 29, 2009 at 02:10:28PM +0200, Nicolas Palix wrote:
> 
> Fix compilation warning by casting the const void *Buffer
> variable into a void *.
> 
> Signed-off-by: Nicolas Palix <npalix@diku.dk>
> ---
>  drivers/staging/hv/Channel.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/hv/Channel.c b/drivers/staging/hv/Channel.c
> index 68f3442..854fa30 100644
> --- a/drivers/staging/hv/Channel.c
> +++ b/drivers/staging/hv/Channel.c
> @@ -787,7 +787,7 @@ VmbusChannelSendPacket(
>  	bufferList[0].Data = &desc;
>  	bufferList[0].Length = sizeof(VMPACKET_DESCRIPTOR);
>  
> -	bufferList[1].Data = Buffer;
> +	bufferList[1].Data = (void *)Buffer;

Yeah, I thought about doing this as well, but it's wrong.  If this
buffer really isn't being modified, then the Data pointer needs to be
const.

Or, if the Data pointer really is going to not be const, then the
function parameters need to be changed, but that means lots of code
needs to be changed.

Hank, what do you think is the correct thing to do here?

thanks,

greg k-h
