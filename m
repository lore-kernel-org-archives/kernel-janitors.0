From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Wed, 01 Sep 2010 18:49:36 +0000
Subject: Re: [alsa-devel] [PATCH 2/4] sound/soc/fsl/p1022_ds.c: Add
Message-Id: <1283366976.3081.248.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283269738-14612-1-git-send-email-julia@diku.dk>
	<1283269738-14612-3-git-send-email-julia@diku.dk>
	<AANLkTinpRVStYfHHaGTyLusMCjMQDH=MvcGVVKaxvHtN@mail.gmail.com>
In-Reply-To: <AANLkTinpRVStYfHHaGTyLusMCjMQDH=MvcGVVKaxvHtN@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@freescale.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Julia Lawall <julia@diku.dk>

On Wed, 2010-09-01 at 13:39 -0500, Timur Tabi wrote:
> On Tue, Aug 31, 2010 at 10:48 AM, Julia Lawall <julia@diku.dk> wrote:
> > Add a call to of_node_put in the error handling code following a call to
> > of_parse_phandle.
> >
> > This patch also moves the existing call to of_node_put tothe end of the
> > error handling code, to make it possible to jump to of_node_put without
> > doing the other cleanup operations.  These appear to be disjoint
> > operations, so the ordering doesn't matter.
> 
> Acked-by: Timur Tabi <timur@freescale.com>

Acked-by: Liam Girdwood <lrg@slimlogic.uo.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

