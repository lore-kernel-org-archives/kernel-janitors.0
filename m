From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 22 Jul 2009 23:44:40 +0000
Subject: Re: [PATCH] media/video/cx88: adding __init/__exit macros to cx88
Message-Id: <alpine.LNX.2.00.0907230144090.11648@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907170100.02816.PeterHuewe@gmx.de> <200907221136.30036.PeterHuewe@gmx.de> <alpine.LNX.2.00.0907221138520.11648@wotan.suse.de> <20090722085436.6ebd43c1@pedra.chehab.org>
In-Reply-To: <20090722085436.6ebd43c1@pedra.chehab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: =?ISO-8859-15?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>, kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Frederic CAND <frederic.cand@anevia.com>, Trent Piepho <xyzzy@speakeasy.org>, Darron Broad <darron@kewl.org>, Steven Toth <stoth@linuxtv.org>, "Igor M. Liplianin" <liplianin@me.by>, Oleg Roitburd <oroitburd@gmail.com>, Yang Hongyang <yanghy@cn.fujitsu.com>, Jelle Foks <jelle@foks.us>, linux-media@vger.kernel.org

On Wed, 22 Jul 2009, Mauro Carvalho Chehab wrote:

> > > > Trivial patch which adds the __init and __exit macros to the 
> > > > module_init / module_exit functions to several files in 
> > > > drivers/media/video/cx88/
> > > >
> > > > linux version 2.6.31-rc3 - linus git tree
> > > >
> > > > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> > > any updates on this patch?
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>

Thanks a lot Mauro, I have queued the patch in trivial tree.

-- 
Jiri Kosina
SUSE Labs
