From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Mon, 24 Jun 2019 08:13:48 +0000
Subject: Re: [PATCH] staging: bcm2835-camera: Avoid apotential sleep while holding a spin_lock
Message-Id: <c8e5abba-7441-b201-1618-c92dfdfc7b1c@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624053351.5217-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190624053351.5217-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, eric@anholt.net, gregkh@linuxfoundation.org, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, tuomas.tynkkynen@iki.fi, inf.braun@fau.de, tobias.buettner@fau.de, hofrat@osadl.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.org>, linux-arm-kernel@lists.infradead.org

Hi Christophe,

Am 24.06.2019 um 07:33 schrieb Christophe JAILLET:
> Do not allocate memory with GFP_KERNEL when holding a spin_lock, it may
> sleep. Use GFP_NOWAIT instead.
>
> Fixes: 950fd867c635 ("staging: bcm2835-camera: Replace open-coded idr with a struct idr.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

there has been a fix for this, which isn't upstreamed yet. The preferred 
solution is to replace the spin_lock with a mutex. Since i'm currently 
working on this i would take care of this.

Sorry about this.

Stefan
