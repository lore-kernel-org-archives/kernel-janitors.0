From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 10 Oct 2010 18:39:34 +0000
Subject: Re: [patch 1/2] OSS: soundcard: locking bug in sound_ioctl()
Message-Id: <201010102039.34858.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101010173352.GB5851@bicker>
In-Reply-To: <20101010173352.GB5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Sunday 10 October 2010 19:33:52 Dan Carpenter wrote:
> We shouldn't return directly here because we're still holding the
> &soundcard_mutex.
> 
> This bug goes all the way back to the start of git.  It's strange that
> no one has complained about it as a runtime bug.
> 
> CC: stable@kernel.org
> Signed-off-by: Dan Carpenter <error27@gmail.com>

It was only recently converted to a mutex from the BKL, which is much
more friendly to misusage because it is automatically released when
the kernel sleeps or when the program exits.

The behavior was already broken with the BKL but the problem was far
less visible. I fear we might be seeing more of these as fallout from
the BKL removal. Sparse should be able to detect most of these cases
though, so maybe we can look more carefully for them.

Acked-by: Arnd Bergmann <arnd@arndb.de>

	Arnd
