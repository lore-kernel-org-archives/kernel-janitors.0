From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 19 Feb 2019 15:18:31 +0000
Subject: Re: [PATCH] carl9170: clean up a clamp() call
Message-Id: <20190219151831.77563608CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218093154.GC7712@kadam>
In-Reply-To: <20190218093154.GC7712@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The parameter order for clamp is supposed to be clamp(value, low, high).
> When we write it in this order it's equivalent to
> min(head->plcp[3] & 0x7f, 75) which works in this context where the min
> is zero.  But it's not a correct use of the API.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Christian Lamparter <chunkeey@gmail.com>

Patch applied to wireless-drivers-next.git, thanks.

dc76bb1e12e9 carl9170: clean up a clamp() call

-- 
https://patchwork.kernel.org/patch/10817541/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
