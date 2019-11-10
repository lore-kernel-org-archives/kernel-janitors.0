From: Vladimir Zapolskiy <vz@mleia.com>
Date: Sun, 10 Nov 2019 22:53:11 +0000
Subject: Re: [PATCH] usb: gadget: udc: lpc32xx: don't dereference ep until it has been null checked
Message-Id: <0e5105e3-768e-c8eb-dd73-d097bb7edfb2@mleia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191110221413.22321-1-colin.king@canonical.com>
In-Reply-To: <20191110221413.22321-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Roland Stigge <stigge@antcom.de>, Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/11/2019 12:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer ep is currently being dereferenced when initializing pointer
> udc before ep is being null checked.  Fix this by only dereferencing
> ep after it has been null checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
