From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 09 Oct 2019 08:27:11 +0000
Subject: Re: [PATCH] rtw88: Fix an error message
Message-Id: <20191009082716.9029761230@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007084805.GA3865@mwanda>
In-Reply-To: <20191007084805.GA3865@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The WARN_ON() macro doesn't take an error message, the argument is a
> condition so this won't display the warning message.
> 
> Fixes: 27e117e4b01b ("rtw88: add deep power save support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

be10b09b278f rtw88: Fix an error message

-- 
https://patchwork.kernel.org/patch/11176989/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
