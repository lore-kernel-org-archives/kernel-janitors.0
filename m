From: Greg KH <gregkh@suse.de>
Date: Thu, 30 Jul 2009 15:58:44 +0000
Subject: Re: [PATCH] Staging: hv: Replace typedef SG_BUFFER_LIST by struct
Message-Id: <20090730155844.GB20557@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907301737.23849.npalix@diku.dk>
In-Reply-To: <200907301737.23849.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 30, 2009 at 05:37:23PM +0200, Nicolas Palix wrote:
> 
> typedef SG_BUFFER_LIST is removed and its uses are replaced by the use of
> struct scatterlist.

Sweet!  thanks for doing this, very nice job, I'll go queue it up.

Hank, you are testing the linux-next tree to make sure we haven't broken
anything yet, right? :)

thanks,

greg k-h
