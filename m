From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 17 Mar 2009 13:20:11 +0000
Subject: Re: [PATCH v2 05/15] NULL noise:
Message-Id: <alpine.LNX.2.00.0903171419490.11733@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net> <20090305191435.30062.72139.stgit@f10box.hanneseder.net> <20090309075832.67483c8e@caramujo.chehab.org>
In-Reply-To: <20090309075832.67483c8e@caramujo.chehab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Hannes Eder <hannes@hanneseder.net>, trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 9 Mar 2009, Mauro Carvalho Chehab wrote:

> > Fix this sparse warnings:
> >   drivers/media/dvb/frontends/drx397xD_fw.h:21:2: warning: Using plain integer as NULL pointer
> >   drivers/media/dvb/frontends/drx397xD_fw.h:22:2: warning: Using plain integer as NULL pointer
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Mauro Carvalho Chehab <mchehab@redhat.com>

Doesn't seem to be present in current -next/-mmotim, applied to trivial 
tree.

-- 
Jiri Kosina
