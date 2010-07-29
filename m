From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 29 Jul 2010 16:13:00 +0000
Subject: Re: [PATCH] char: ip2: check put_user() result
Message-Id: <20100729171300.5ecc0bc2@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280418938-5833-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280418938-5833-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "Michael H. Warfield" <mhw@wittsend.com>, Greg Kroah-Hartman <gregkh@suse.de>, Rakib Mullick <rakib.mullick@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org

O> -	return dumpcount;
> +	return rc ? -EFAULT : dumpcount;

This is actually at least as wrong as before.

The standards say that if you successfully return some data you should
report the bytes returned. Normally it doesn't matter much because the
data has not been 'lost' when it gets called again.

If you actually remove the data from the queue it ought to be getting
reported with a suitable length.

Alan
