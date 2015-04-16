From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 16 Apr 2015 10:22:05 +0000
Subject: Re: [PATCH] ALSA: remove deprecated use of pci api
Message-Id: <s5hmw28qsoi.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429107018-8552-1-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1429107018-8552-1-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Thibaut Varene <T-Bone@parisc-linux.org>, Jaroslav Kysela <perex@perex.cz>, Jaya Kumar <jayakumar.alsa@gmail.com>, linux-parisc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Wed, 15 Apr 2015 16:10:17 +0200,
Quentin Lambert wrote:
> 
> Replace occurences of the pci api by appropriate call to the dma api.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr)
> 
> @deprecated@
> idexpression id;
> position p;
> @@
> 
> (
>   pci_dma_supported@p ( id, ...)
> |
>   pci_alloc_consistent@p ( id, ...)
> )
> 
> @bad1@
> idexpression id;
> position deprecated.p;
> @@
> ...when != &id->dev
>    when != pci_get_drvdata ( id )
>    when != pci_enable_device ( id )
> (
>   pci_dma_supported@p ( id, ...)
> |
>   pci_alloc_consistent@p ( id, ...)
> )
> 
> @depends on !bad1@
> idexpression id;
> expression direction;
> position deprecated.p;
> @@
> 
> (
> - pci_dma_supported@p ( id,
> + dma_supported ( &id->dev,
> ...
> + , GFP_ATOMIC
>   )
> |
> - pci_alloc_consistent@p ( id,
> + dma_alloc_coherent ( &id->dev,
> ...
> + , GFP_ATOMIC
>   )
> )
> 
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

Thanks, applied to for-4.2 branch.


Takashi
