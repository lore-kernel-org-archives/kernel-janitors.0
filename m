From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 08 Jul 2010 21:02:39 +0000
Subject: Re: [PATCH] bluetooth: btmrvl_sdio: silence warning
Message-Id: <1278622959.10421.68.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278316883-29784-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278316883-29784-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Bing Zhao <bzhao@marvell.com>, Ben Hutchings <ben@decadent.org.uk>, =?ISO-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Julia Lawall <julia@diku.dk>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Kulikov,

> Clone checking of ret to simplify the code.
> 
> This patch silences a compiler warning:
> drivers/bluetooth/btmrvl_sdio.c: In function ‘btmrvl_sdio_verify_fw_download’:
> drivers/bluetooth/btmrvl_sdio.c:80: warning: ‘fws1’ may be used uninitialized in this function
> drivers/bluetooth/btmrvl_sdio.c:80: note: ‘fws1’ was declared here
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

patch has been applied to bluetooth-next-2.6 tree. Thanks.

Regards

Marcel


