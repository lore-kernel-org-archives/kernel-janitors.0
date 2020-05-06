From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 06 May 2020 08:44:42 +0000
Subject: Re: [PATCH] libertas_tf: avoid a null dereference in pointer priv
Message-Id: <20200506084442.A123EC433BA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501173900.296658-1-colin.king@canonical.com>
In-Reply-To: <20200501173900.296658-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Lubomir Rintel <lkundrak@v3.sk>, Steve deRosier <derosier@cal-sierra.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is a check if priv is null when calling lbtf_remove_card
> but not in a previous call to if_usb_reset_dev that can also dereference
> priv.  Fix this by also only calling lbtf_remove_card if priv is null.
> 
> It is noteable that there don't seem to be any bugs reported that the
> null pointer dereference has ever occurred, so I'm not sure if the null
> check is required, but since we're doing a null check anyway it should
> be done for both function calls.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: baa0280f08c7 ("libertas_tf: don't defer firmware loading until start()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

049ceac308b0 libertas_tf: avoid a null dereference in pointer priv

-- 
https://patchwork.kernel.org/patch/11523055/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
