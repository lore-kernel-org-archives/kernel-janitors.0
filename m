From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 07 Nov 2017 18:46:53 +0000
Subject: Re: [PATCH][V2] usb: gadget: pxa27x: Remove redundant assignment to is_short and dev
Message-Id: <87a7zy7wpu.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107143914.5748-1-colin.king@canonical.com>
In-Reply-To: <20171107143914.5748-1-colin.king@canonical.com> (Colin King's
 message of "Tue, 7 Nov 2017 14:39:14 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Variable is_short is set to zero but this value is never read as it is
> overwritten with a new value later on, hence it is a redundant
> assignment and can be removed.  Pointer dev is assigned a value that
> is not read and it is updated a few statements later, this too is
> redundant and can be removed. Cleans up clan warnings:
>
> drivers/usb/gadget/udc/pxa27x_udc.c:986:3: warning: Value stored
> to 'is_short' is never read
> drivers/usb/gadget/udc/pxa27x_udc.c:1141:2: warning: Value stored
> to 'dev' is never read

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
