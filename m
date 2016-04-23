From: Afzal Mohammed <afzal.mohd.ma@gmail.com>
Date: Sat, 23 Apr 2016 06:59:45 +0000
Subject: Re: [patch] Bluetooth: ath3k: Silence uninitialized variable warning
Message-Id: <20160423064745.GA4826@afzalpc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160422100255.GE11398@mwanda>
In-Reply-To: <20160422100255.GE11398@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Gustavo Padovan <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On Fri, Apr 22, 2016 at 01:02:55PM +0300, Dan Carpenter wrote:

> -	int err, pipe, len, size, count, sent = 0;
> +	int len = 0;
> +	int err, pipe, size, count, sent = 0;

Is there any particular reason to avoid more than 1 variable
initialization in definition on a single line ?, like,

	int err, pipe, size, count, sent = 0, len = 0;

have observed that none of your uninitialized variable warning fixes
does as mentioned above.

Regards
afzal
