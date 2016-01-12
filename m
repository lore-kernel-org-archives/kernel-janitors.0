From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 12 Jan 2016 09:12:21 +0000
Subject: Re: [PATCH 0/2] mfd: smsc-ece1099: Fine-tuning for smsc_i2c_probe()
Message-Id: <20160112091221.GU19803@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
 <20160111080850.GR3331@x1>
 <5694C0AF.2070809@users.sourceforge.net>
In-Reply-To: <5694C0AF.2070809@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 12 Jan 2016, SF Markus Elfring wrote:

> > This set is confusing.
> > 
> > Why do you have a cover letter specifying this as a 2 patch set,
> > yet there are 4 patches attached to it?
> 
> I do not see too many messages for this update suggestion.

In my inbox, your set looks like this:

Dec 29 2015 SF Markus Elfring (  0) ┬>[PATCH] mfd-dm355evm_msp: One function call less in add_child() after error detection
Dec 29 2015 SF Markus Elfring (  0) ├>[PATCH 0/2] mfd: smsc-ece1099: Fine-tuning for smsc_i2c_probe()
Dec 29 2015 SF Markus Elfring (  0) │├>[PATCH 2/2] mfd: smsc-ece1099: Refactoring for smsc_i2c_probe()
Dec 29 2015 SF Markus Elfring (  0) │└>[PATCH 1/2] mfd: smsc-ece1099: Delete an unnecessary variable initialisation in smsc_i2c_probe()
Dec 29 2015 SF Markus Elfring (  0) └>[PATCH] mfd: twl-core: One function call less in add_numbered_child() after error detection

... which is unconventional and pretty confusing.

> >> From: Markus Elfring <elfring@users.sourceforge.net>
> >> Date: Tue, 29 Dec 2015 15:10:48 +0100
> > 
> > What format is this?
> 
> Are such specifications needed to preserve the desired authorship information
> during the transfer of commit messages by email?

How did you sent this set?  I fear you are sending these patches
manually, using your mail client.  You should instead be creating
patches with `git format-patch` and sending them using `git
send-email`.  Then the formatting will be correct.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
