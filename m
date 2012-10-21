From: Jean Delvare <khali@linux-fr.org>
Date: Sun, 21 Oct 2012 12:16:59 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15]  drivers/input/keyboard/adp5588-keys.c:52:19: error: field
Message-Id: <20121021141659.4dd53d00@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009092343.7572fb53@endymion.delvare>
In-Reply-To: <20121009092343.7572fb53@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 21 Oct 2012 09:48:49 +0800, Fengguang Wu wrote:
> On Tue, Oct 16, 2012 at 09:19:41AM +0200, Jean Delvare wrote:
> > I sent you a patch yesterday which should fix the issue:
> > http://khali.linux-fr.org/devel/linux-3/jdelvare-i2c/i2c-i801-02-fix-gpiolib-dependency.patch
> > It's in linux-next already. Can you please test it and confirm it does
> > fix the issue?
> 
> Hi Jean, I just sent you another report. I found that it can still be
> reproduced in upstream 3.7-rc2 and linux-next 20121019.

It turns out that linux-next no longer seems to include my i2c patches.
Stephen, can you please check?

Thanks,
-- 
Jean Delvare
