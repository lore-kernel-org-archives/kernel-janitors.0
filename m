From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Oct 2012 01:48:49 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15] drivers/input/keyboard/adp5588-keys.c:52:19: error: field
Message-Id: <20121021014849.GA2846@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121008071452.GA29214@localhost>
In-Reply-To: <20121008071452.GA29214@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 16, 2012 at 09:19:41AM +0200, Jean Delvare wrote:
> Hi Fengguang,
> 
> On Tue, 16 Oct 2012 11:18:58 +0800, Fengguang Wu wrote:
> > Hi Jean,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
> > head:   c415b303a704e5c5f766fc0404093910c36cc4ab
> > commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
> > config: parisc-allyesconfig # make ARCH=parisc allyesconfig
> 
> I sent you a patch yesterday which should fix the issue:
> http://khali.linux-fr.org/devel/linux-3/jdelvare-i2c/i2c-i801-02-fix-gpiolib-dependency.patch
> It's in linux-next already. Can you please test it and confirm it does
> fix the issue?

Hi Jean, I just sent you another report. I found that it can still be
reproduced in upstream 3.7-rc2 and linux-next 20121019.

Thanks,
Fengguang
