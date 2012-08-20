From: AceLan Kao <acelan.kao@canonical.com>
Date: Mon, 20 Aug 2012 02:17:41 +0000
Subject: Re: [platform-drivers-x86:linux-next 9/12] drivers/platform/x86/asus-wmi.c:892:3: error: implicit de
Message-Id: <CAMz9Wg_Ji2Uwrqd18PuuHpcD=2NX3vDXPCM0GMACHLO0aDU0VQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120817225444.GA18579@srcf.ucam.org>
In-Reply-To: <20120817225444.GA18579@srcf.ucam.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

The rfkill patch is still not in linux-next, so I just wrote to the
rfkill maintainer.
Hope he could merge the patch quicker.

That patch just reverts this commit, you can do it yourself if you would like to
build the kernel.

commit 2e48928d8a0f38c1b5c81eb3f1294de8a6382c68
Author: Stephen Hemminger <shemminger@vyatta.com>
Date:   Wed Oct 20 10:16:58 2010 -0700

    rfkill: remove dead code

    The following code is defined but never used.

    Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
    Signed-off-by: John W. Linville <linville@tuxdriver.com>

Best regards,
AceLan Kao.

2012/8/18 Fengguang Wu <fengguang.wu@intel.com>:
> On Fri, Aug 17, 2012 at 11:54:44PM +0100, Matthew Garrett wrote:
>> There's supposed to be an rfkill patch for this - has it not made it
>> into -next yet?
>
> Matthew, I'm testing your branch alone, whose HEAD 973713e still has
> the problem. If it's due to dependency on another patch in linux-next,
> please just ignore this error.
>
> Thanks,
> Fengguang



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
