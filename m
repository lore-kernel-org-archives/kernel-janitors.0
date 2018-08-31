From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 31 Aug 2018 15:43:53 +0000
Subject: Re: [PATCH] libertas_tf: prevent underflow in process_cmdrequest()
Message-Id: <20180831154353.A86F3606CF@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090747.a7gcph2wa6abyimi@kili.mountain>
In-Reply-To: <20180814090747.a7gcph2wa6abyimi@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Luis Carlos Cobo <luisca@cozybit.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If recvlength is less than MESSAGE_HEADER_LEN (4) we would end up
> corrupting memory.
> 
> Fixes: c305a19a0d0a ("libertas_tf: usb specific functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

3348ef6a6a12 libertas_tf: prevent underflow in process_cmdrequest()

-- 
https://patchwork.kernel.org/patch/10565197/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
