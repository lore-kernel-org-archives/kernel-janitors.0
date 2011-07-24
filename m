From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 24 Jul 2011 11:59:26 +0000
Subject: Re: sound: constify snd_ac97_bus_ops
Message-Id: <s5h4o2b51pd.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <208430.5747.bm@smtp121.mail.ukl.yahoo.com>
In-Reply-To: <208430.5747.bm@smtp121.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>, Kees Cook <kees.cook@canonical.com>

At Sun, 24 Jul 2011 11:40:48 +0200,
Lionel Debroux wrote:
> 
> The fields of this struct type don't seem to be used as rvalues, besides
> the initialization of struct instances. Let's make const the struct
> instances.
> 
> Maybe the Documentation/DocBook/writing-an-alsa-driver.tmpl, and
> checkpatch.pl should be updated to reflect this change ?

Yes, please either update or give an additional patch for document
fixes.

I'll apply these series not for 3.1 since this changes API.  Will be
applied the branches for 3.2.


thanks,

Takashi
