From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 17 Dec 2020 06:39:00 +0000
Subject: Re: [PATCH][next] ath11k: add missing null check on allocated skb
Message-Id: <87ft45uebf.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214232417.84556-1-colin.king@canonical.com>
 <20201217063600.E5DB2C43461@smtp.codeaurora.org>
In-Reply-To: <20201217063600.E5DB2C43461@smtp.codeaurora.org> (Kalle Valo's
 message of "Thu, 17 Dec 2020 06:36:00 +0000 (UTC)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Colin King <colin.king@canonical.com> wrote:
>
>> Currently the null check on a newly allocated skb is missing and
>> this can lead to a null pointer dereference is the allocation fails.
>> Fix this by adding a null check and returning -ENOMEM.
>> 
>> Addresses-Coverity: ("Dereference null return")
>> Fixes: 43ed15e1ee01 ("ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Patch applied to ath-current branch of ath.git, thanks.
>
> c86a36a621f2 ath11k: add missing null check on allocated skb

I did a mistake and that commit id will change, so please disregard
this. There will be a new mail soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
