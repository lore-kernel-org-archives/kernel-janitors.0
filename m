From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 03 Dec 2020 09:16:29 +0000
Subject: Re: [PATCH net] rtw88: debug: Fix uninitialized memory in debugfs code
Message-Id: <87pn3rgsgi.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8ilOfVz3pf0T5ec@mwanda>
In-Reply-To: <X8ilOfVz3pf0T5ec@mwanda> (Dan Carpenter's message of "Thu, 3 Dec
        2020 11:43:37 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yan-Hsuan Chuang <tony0620emma@gmail.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This code does not ensure that the whole buffer is initialized and none
> of the callers check for errors so potentially none of the buffer is
> initialized.  Add a memset to eliminate this bug.
>
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/realtek/rtw88/debug.c | 2 ++
>  1 file changed, 2 insertions(+)

I'll take this to wireless-drivers, this shouldn't go to net.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
