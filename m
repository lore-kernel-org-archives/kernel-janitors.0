From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 27 Sep 2012 02:15:21 +0000
Subject: Re: [tty:tty-next 36/40] kernel/debug/kdb/kdb_main.c:2839:4: warning: passing argument 2 of 'kdb_reg
Message-Id: <20120927021521.GA31724@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927012916.GA9207@localhost>
 <20120927013223.GA20262@kroah.com>
 <20120927013622.GA9936@localhost>
In-Reply-To: <20120927013622.GA9936@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Anton Vorontsov <anton.vorontsov@linaro.org>, Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>

On Thu, Sep 27, 2012 at 09:36:22AM +0800, Fengguang Wu wrote:
> On Wed, Sep 26, 2012 at 06:32:23PM -0700, Greg KH wrote:
> > On Thu, Sep 27, 2012 at 09:29:16AM +0800, Fengguang Wu wrote:
> > > Hi Anton,
> > > 
> > > FYI, there are new compile warnings show up in
> > > 
> > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
> > > head:   0c57dfcc6c1d037243c2f8fbf62eab3633326ec0
> > > commit: 729043e82cdd403a131127254528afea8031ebab [36/40] kdb: Turn KGDB_KDB=n stubs into static inlines
> > > config: cris-allyesconfig
> > 
> > Does the CRIS platform even support KDB?  Perhaps that is why this is
> > failing so badly?
> 
> Yes, I guess so.. Ignore it, or fix it by changing Kconfig to disable
> KDB in the unsupported archs?

Sounds like a good idea, Jason?

greg k-h
