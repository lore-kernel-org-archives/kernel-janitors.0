From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 15 Oct 2012 03:13:22 +0000
Subject: Re: [signal:arch-cris 1/2] arch/cris/arch-v10/kernel/process.c:147:2: error: implicit declaration of
Message-Id: <20121015031322.GD2616@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015022604.GG7203@localhost>
In-Reply-To: <20121015022604.GG7203@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2012 at 10:26:04AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-cris
> head:   b390891871081c499675f874eb08485c82959f00
> commit: 40be7b4e5cfa2eec0a7f44f6edfdcf6802111bb1 [1/2] cris: switch to generic kernel_thread()
> config: cris-etrax-100lx_v2_defconfig # make ARCH=cris etrax-100lx_v2_defconfig
Missing include.  Fixed and pushed.
