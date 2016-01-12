From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 12 Jan 2016 11:14:07 +0000
Subject: Re: mfd: smsc-ece1099: Fine-tuning for smsc_i2c_probe()
Message-Id: <20160112111407.GC27358@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
 <20160111080850.GR3331@x1>
 <5694C0AF.2070809@users.sourceforge.net>
 <20160112091221.GU19803@x1>
 <5694DD6C.7050405@users.sourceforge.net>
In-Reply-To: <5694DD6C.7050405@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 12 Jan 2016, SF Markus Elfring wrote:

> > In my inbox, your set looks like this:
> 
> Thanks for your information. - I find the display correct.
> 
> > ... which is unconventional and pretty confusing.
> 
> Do you request that I should resend my four update suggestions
> for different components as a single patch series for the software
> area "drivers/mfd"?

You have to make that decision yourself.  What I'm saying is, if the
cover letter says there are 2 patches in the set, that's what we
should expect.

> > I fear you are sending these patches manually, using your mail client.
> 
> I admit that I am doing this usually.

Please don't do that.

> > You should instead be creating patches with `git format-patch`
> 
> This happens also …
> 
> > and sending them using `git send-email`.
> 
> I prefer other software tools for this task so far.

Such as?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
