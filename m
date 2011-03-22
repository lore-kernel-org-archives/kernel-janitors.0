From: Felipe Balbi <balbi@ti.com>
Date: Tue, 22 Mar 2011 09:21:43 +0000
Subject: Re: [patch 3/4] USB: musb: silence printk format warning
Message-Id: <20110322092141.GU1837@legolas.emea.dhcp.ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110320111617.GK2008@bicker>
In-Reply-To: <20110320111617.GK2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Sun, Mar 20, 2011 at 02:16:17PM +0300, Dan Carpenter wrote:
> Gcc gives the following warnings:
> 
> drivers/usb/musb/cppi_dma.c: In function ‘cppi_next_tx_segment’:
> drivers/usb/musb/cppi_dma.c:600: warning: format ‘%x’ expects type ‘unsigned int’, but argument 8 has type ‘dma_addr_t’
> drivers/usb/musb/cppi_dma.c: In function ‘cppi_next_rx_segment’:
> drivers/usb/musb/cppi_dma.c:822: warning: format ‘%x’ expects type ‘unsigned int’, but argument 9 has type ‘dma_addr_t’
> drivers/usb/musb/cppi_dma.c: In function ‘cppi_rx_scan’:
> drivers/usb/musb/cppi_dma.c:1042: warning: format ‘%08x’ expects type ‘unsigned int’, but argument 4 has type ‘dma_addr_t’
> drivers/usb/musb/cppi_dma.c:1114: warning: format ‘%08x’ expects type ‘unsigned int’, but argument 7 has type ‘dma_addr_t’
> 
> dma_addr_t is sometimes 32 bit and sometimes 64.  We normally cast them
> to unsigned long long for printk().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

applied, thanks

-- 
balbi
