From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 16 Oct 2012 07:19:41 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15]  drivers/input/keyboard/adp5588-keys.c:52:19: error: field
Message-Id: <20121016091941.63324e19@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009092343.7572fb53@endymion.delvare>
In-Reply-To: <20121009092343.7572fb53@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Tue, 16 Oct 2012 11:18:58 +0800, Fengguang Wu wrote:
> Hi Jean,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
> head:   c415b303a704e5c5f766fc0404093910c36cc4ab
> commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
> config: parisc-allyesconfig # make ARCH=parisc allyesconfig

I sent you a patch yesterday which should fix the issue:
http://khali.linux-fr.org/devel/linux-3/jdelvare-i2c/i2c-i801-02-fix-gpiolib-dependency.patch
It's in linux-next already. Can you please test it and confirm it does
fix the issue?

Thanks,
-- 
Jean Delvare
