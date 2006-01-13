From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 13 Jan 2006 18:53:24 +0000
Subject: Re: [KJ] [Patch v3] Replacing 0xff.. with correct DMA_xBIT_MASK
Message-Id: <20060113185324.GB1528@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2614326220096288=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43C7F1BC.1080109@gmx.de>
In-Reply-To: <43C7F1BC.1080109@gmx.de>
To: kernel-janitors@vger.kernel.org

--===============2614326220096288==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2006-01-13 at 19:30:20 +0100, M.Gehre <M.Gehre@gmx.de> wrote:
> Included is a patch to replace all occurences of 0xff..
> in calls to function pci_set_dma_mask() and pci_set_consistant_dma_mask()
> with the corresponding DMA_xBIT_MASK from linux/dma-mapping.h.
> This patch was made against 2.6.15-git9.

I did quite some of them (DMA_32BIT_MASK and DMA_64BIT_MASK) and they're
already in -kj or the respective subsystem trees, though I did not do
the odd ones using DMA_{24,39,etc}_BIT_MASK ;-)

Splitting them up by subsystems would make it easier for thze
maintainers to pick the relevant ones, as also mentioned in the KJ FAQ
at [1]. Besides that the patch looks good to me.

[1] http://kerneljanitors.org/faq

Cheers, Tobias

--===============2614326220096288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2614326220096288==--
