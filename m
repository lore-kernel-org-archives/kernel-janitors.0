From: "David S. Miller" <davem@redhat.com>
Date: Wed, 18 Jun 2008 20:53:27 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <20080618.165327.101052229.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Jaswinder Singh <jaswinder@infradead.org>
Date: Wed, 18 Jun 2008 19:58:33 +0530

> Firmware blob is big-endian starts with version numbers, 
> followed by start address and length. 
> length = end_address_of_bss - start_address_of_text.
> Remainder is the blob to be loaded contiguously from start address.
> 
> Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>

Please use my upstream email address not my RH one.

And NACK on this patch.

