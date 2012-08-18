From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 18 Aug 2012 00:55:04 +0000
Subject: Re: [platform-drivers-x86:linux-next 9/12] drivers/platform/x86/asus-wmi.c:892:3: error: implicit de
Message-Id: <20120818005504.GB5201@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120817225444.GA18579@srcf.ucam.org>
In-Reply-To: <20120817225444.GA18579@srcf.ucam.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 17, 2012 at 11:54:44PM +0100, Matthew Garrett wrote:
> There's supposed to be an rfkill patch for this - has it not made it 
> into -next yet?

Matthew, I'm testing your branch alone, whose HEAD 973713e still has
the problem. If it's due to dependency on another patch in linux-next,
please just ignore this error.

Thanks,
Fengguang
