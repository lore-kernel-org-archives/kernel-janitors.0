From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Nov 2015 12:59:17 +0000
Subject: Re: brcm80211: fix error code in brcmf_pcie_exit_download_state()
Message-Id: <20151130125917.A242C1409E0@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151127134327.GA16802@mwanda>
References: <20151127134327.GA16802@mwanda>
In-Reply-To: <20151127134327.GA16802@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org


> The original code returns 1 on failure and 0 on success but the caller
> was expecting an error code on failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
