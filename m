From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 15 Jan 2020 19:26:52 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: unlock on error in probe
Message-Id: <s5ho8v4plkz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115174604.rhanfgy4j3uc65cx@kili.mountain>
In-Reply-To: <20200115174604.rhanfgy4j3uc65cx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Alexander Tsoy <alexander@tsoy.me>, Shuah Khan <shuah@kernel.org>

On Wed, 15 Jan 2020 18:46:04 +0100,
Dan Carpenter wrote:
> 
> We need to unlock before we returning on this error path.
> 
> Fixes: 73ac9f5e5b43 ("ALSA: usb-audio: Add boot quirk for MOTU M Series")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi
