From: Greg KH <greg@kroah.com>
Date: Thu, 28 Oct 2010 20:45:09 +0000
Subject: Re: [PATCH 1/8] staging: dream: fix information leak to userland
Message-Id: <20101028204509.GC22785@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288296098-18936-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288296098-18936-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>, Iliyan Malchev <ibm@android.com>, Pavel Machek <pavel@ucw.cz>, Brian Swetland <swetland@google.com>, San Mehat <san@android.com>
Cc: kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On Fri, Oct 29, 2010 at 12:01:37AM +0400, Vasiliy Kulikov wrote:
> Structure msm_audio_stats is copied to userland with some fields unitialized.
> It leads to leaking of contents of kernel stack memory.
> Also struct msm_audio_config has field "unused" of type array of 3 elements,
> not 4.  Instead of this, initialize field "type".
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  drivers/staging/dream/qdsp5/audio_aac.c |    3 ++-

{sigh}

I'd really like to just drop this whole driver as I feel it's _way_
behind whatever anyone is really using "in the wild".

Actually, I doubt that anyone even uses this thing, do they?

Any objection to me just dropping the drivers/staging/dream/ tree?
People should be working on the chipset-specific driver tree here
instead, right?

Pavel, it looks like you're not doing any dream work anymore, any
problems with me dropping it?

thanks,

greg k-h
