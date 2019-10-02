From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 02 Oct 2019 04:35:08 +0000
Subject: Re: [PATCH v2] cw1200: Fix a signedness bug in cw1200_load_firmware()
Message-Id: <20191002043508.7A7B0602F2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191001114501.GA6550@mwanda>
In-Reply-To: <20191001114501.GA6550@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Solomon Peachy <pizza@shaftnet.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "priv->hw_type" is an enum and in this context GCC will treat it
> as an unsigned int so the error handling will never trigger.
> 
> Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

4a50d454502f cw1200: Fix a signedness bug in cw1200_load_firmware()

-- 
https://patchwork.kernel.org/patch/11168561/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
