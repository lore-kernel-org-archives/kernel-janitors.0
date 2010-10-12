From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Oct 2010 06:39:14 +0000
Subject: Re: [patch 1/2] OSS: soundcard: locking bug in sound_ioctl()
Message-Id: <201010120839.15257.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101010173352.GB5851@bicker> <201010112242.19246.arnd@arndb.de> <20101011222307.GA10570@feather>
In-Reply-To: <20101011222307.GA10570@feather>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Triplett <josh@joshtriplett.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Dan Carpenter <error27@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-sparse@vger.kernel.org

On Tuesday 12 October 2010 00:23:08 Josh Triplett wrote:
> Assuming that the underlying function only returns zero/non-zero and
> that the actual return value doesn't matter, then you can use the
> __cond_lock macro from compiler.h for this:
> 
> # define __cond_lock(x,c)       ((c) ? ({ __acquire(x); 1; }) : 0)
> 

The return from mutex_lock_{killable,interruptible} is an error
value, not true/false, so it actually matters. We know that the only
possible error that is currently returned is -EINTR though, so we
could do a similar trick and define another

#define __cond_mutex(x, c)	((!c) ? ({ __acquire(x); 0; }) : -EINTR)

My fear was that this would impact code generation.

	Arnd
