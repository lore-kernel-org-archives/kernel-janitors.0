From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 09 May 2015 13:58:31 +0000
Subject: Re: brcmfmac: cleanup a sizeof()
Message-Id: <20150509135831.0FA7D1402A4@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150507095919.GB17996@mwanda>
References: <20150507095919.GB17996@mwanda>
In-Reply-To: <20150507095919.GB17996@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org


> "flowrings" and "*flowrings" are both pointers so this always returns
> sizeof(void *) and the current code works fine.  But "*flowrings" is
> intended here and static checkers complain, so lets change it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
