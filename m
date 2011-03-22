From: Felipe Balbi <balbi@ti.com>
Date: Tue, 22 Mar 2011 09:21:59 +0000
Subject: Re: [patch 4/4] USB: musb: dereferencing an iomem pointer
Message-Id: <20110322092158.GV1837@legolas.emea.dhcp.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110320111826.GL2008@bicker>
In-Reply-To: <20110320111826.GL2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 20, 2011 at 02:18:26PM +0300, Dan Carpenter wrote:
> "tx_ram" points to io memory.  We can't dereference it directly.  Sparse
> complains about this: "drivers/usb/musb/cppi_dma.c:1205:25: warning: 
> dereference of noderef expression"
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

applied, thanks

-- 
balbi
