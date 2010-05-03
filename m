From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Mon, 03 May 2010 13:15:06 +0000
Subject: Re: [PATCH 1/7] drivers/staging/comedi: dev_node removal
Message-Id: <20100503131506.GB10064@comet.dominikbrodowski.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hey,

On Fri, Apr 30, 2010 at 04:30:07PM -0400, Javier Martinez Canillas wrote:
> This is the first patch of a patch series that removes dev_node in comedi drivers.
> 
> I got a build error trying to compile comedi drivers due dev_node removal in struct pcmcia_device.
> 
> I first generated a patch against linux-next tree to solve the issue. But then was told that this change has to go through pcmcia tree.
> 
> So I generate the patches against pcmcia-2.6 git tree and also split the patch in seven small patches so it would be easier to review.
> 
> Thanks a lot.

Applied all seven patches. Thanks a lot!

Best,
	Dominik
