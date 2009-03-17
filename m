From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 17 Mar 2009 13:21:36 +0000
Subject: Re: [PATCH v2 06/15] NULL noise: drivers/mtd/tests/mtd_*test.c
Message-Id: <alpine.LNX.2.00.0903171421200.11733@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net> <20090305191457.30062.43881.stgit@f10box.hanneseder.net> <49B0BE07.5080803@nokia.com>
In-Reply-To: <49B0BE07.5080803@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: ext Hannes Eder <hannes@hanneseder.net>, "trivial@kernel.org" <trivial@kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 6 Mar 2009, Artem Bityutskiy wrote:

> Hannes Eder wrote:
> > Fix this sparse warnings:
> >   drivers/mtd/tests/mtd_oobtest.c:139:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:192:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:219:41: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:284:25: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:525:25: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:545:25: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:569:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:589:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:613:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:633:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:673:41: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_oobtest.c:701:33: warning: Using plain integer as
> > NULL pointer
> >   drivers/mtd/tests/mtd_readtest.c:74:41: warning: Using plain integer as
> > NULL pointer
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> > Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Yes, please, take this patch.

Doesn't seem to be present in current -next/-mmotim, applied to trivial
tree.

-- 
Jiri Kosina
