From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Nov 2015 12:58:07 +0000
Subject: Re: rt2x00: type bug in _rt2500usb_register_read()
Message-Id: <20151130125807.4FB601409D1@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151126115523.GD10556@mwanda>
References: <20151126115523.GD10556@mwanda>
In-Reply-To: <20151126115523.GD10556@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, Helmut Schaa <helmut.schaa@googlemail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> This code causes a static checker bug.
> 
> drivers/net/wireless/ralink/rt2x00/rt2500usb.c:232 _rt2500usb_register_read()
> warn: passing casted pointer 'value' to 'rt2500usb_register_read()' 32 vs 16.
> 
> If the low 16 bits were initialized to zero then this code would only be
> a problem on big endian systems.  But in this case this is case the low
> 16 bits are never initialized.  This is called from a function which is
> created using a macro:
> 
> RT2X00DEBUGFS_OPS(csr, "0x%.8x\n", u32);
> 
> We end up copying uninitialized data to the user which is bogus and an
> information leak.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
