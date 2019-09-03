From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 03 Sep 2019 13:35:27 +0000
Subject: Re: [PATCH] rtw88: Fix an error message
Message-Id: <20190903133527.9C703602CA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190814104642.GA14268@mwanda>
In-Reply-To: <20190814104642.GA14268@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The WARN_ON() macro takes a condition, not a warning message.  I've
> changed this to use WARN() instead.
> 
> Fixes: 4136214f7c46 ("rtw88: add BT co-existence support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

52929cad3293 rtw88: Fix an error message

-- 
https://patchwork.kernel.org/patch/11093733/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
