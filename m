From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 08 Jul 2010 22:01:19 +0000
Subject: Re: [PATCH 9/20] drivers/bluetooth: Use kzalloc
Message-Id: <1278626479.10421.85.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132201470.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132201470.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

> Use kzalloc rather than the combination of kmalloc and memset.
> 

patch has been applied to bluetooth-next-2.6 tree. Thanks.

Regards

Marcel


