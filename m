From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 24 Oct 2012 09:11:02 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15] drivers/leds/leds-tca6507.c:179:20: error: field 'gpio' ha
Message-Id: <20121024091102.GA2241@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121016055829.GA31864@localhost>
 <20121024110706.69282b16@endymion.delvare>
In-Reply-To: <20121024110706.69282b16@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: kernel-janitors@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>

Hi Jean,

On Wed, Oct 24, 2012 at 11:07:06AM +0200, Jean Delvare wrote:
> Hi Fengguang,
> 
> On Tue, 16 Oct 2012 13:58:29 +0800, Fengguang Wu wrote:
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
> > head:   c415b303a704e5c5f766fc0404093910c36cc4ab
> > commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
> > config: parisc-allyesconfig # make ARCH=parisc allyesconfig
> 
> Can you please confirm that this problem is fixed in linux-next now? If
> it is OK I'll send the fix to Linus quickly.

Sure. I just confirmed that linux-next 20121024 builds fine now!

Thanks,
Fengguang
