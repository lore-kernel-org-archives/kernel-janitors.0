From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 05 Jan 2010 10:31:05 +0000
Subject: Re: [PATCH 10/10] media/dvb: add __init/__exit macros to
Message-Id: <alpine.LNX.2.00.1001051130550.2277@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261471095-24272-1-git-send-email-peterhuewe@gmx.de> <20100105111348.4a2091bd@hyperion.delvare>
In-Reply-To: <20100105111348.4a2091bd@hyperion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 5 Jan 2010, Jean Delvare wrote:

> > Trivial patch which adds the __init/__exit macros to the module_init/
> > module_exit functions of
> > 
> > drivers/media/dvb/bt8xx/bt878.c
> > 
> > Please have a look at the small patch and either pull it through
> > your tree, or please ack' it so Jiri can pull it through the trivial
> > tree.
> > 
> > Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
> > but also present in linus tree.
> > 
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> 
> Acked-by: Jean Delvare <khali@linux-fr.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
