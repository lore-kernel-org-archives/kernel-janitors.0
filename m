From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 11 Nov 2020 09:55:05 +0000
Subject: Re: [PATCH][v2] Bluetooth: hci_qca: resolve various warnings
Message-Id: <054F4CD9-1A1B-41EB-8C18-EB02CC3E9E56@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201111045538.GA90261@fedora-project>
In-Reply-To: <20201111045538.GA90261@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Christian <nigel.l.christian@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org

Hi Nigel,

> Replace symbolic permissions with octal values. Use usleep_range
> for small msec values due to the fact that msleep() less than 
> 20ms may have unexpected behavior/sleep longer.
> 
> - https://lkml.org/lkml/2016/8/2/1945
> - Documentation/timers/timers-howto.rst
> 
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
> drivers/bluetooth/hci_qca.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
