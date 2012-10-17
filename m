From: Zach Brown <zab@zabbo.net>
Date: Wed, 17 Oct 2012 17:52:24 +0000
Subject: Re: [shaggy:loop_v3 16/22] drivers/block/loop.c:219:20: warning: cast to pointer from integer of dif
Message-Id: <20121017175224.GG17678@lenny.home.zabbo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017154411.GA21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121017154411.GA21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 17, 2012 at 11:29:35AM -0500, Dave Kleikamp wrote:
> On 10/17/2012 10:44 AM, Yuanhan Liu wrote:
> > Hi Zack,
> > 
> > FYI, there are new compile warnings show up in
> > 
> > tree:   git://github.com/kleikamp/linux-shaggy loop_v3
> > head:   b8ee8b4bb91520b2c4a1f567977a737e9e71c449
> > commit: 9a9b1c625a5b11d9b90c0ee664eacde0aea6afeb [16/22] loop: use aio to perform io on the underlying file
> > config: i386-randconfig-m011 (attached as .config)
> 
> That was quick. I just pushed that out to github and hadn't announced it
> anywhere. I didn't realize that a new branch on my tree would be
> automatically tested, but I'm glad this got caught!

Yeah, it's pretty great.

> It looks like I need to compile for a 32-bit platform before sending
> this out to a larger audience.

I trust that you can just throw an unsigned long or intptr_t cast in
there and refresh it, but let me know if you want me to take care of
anything :)

- z
