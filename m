From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 22 Sep 2020 07:46:58 +0000
Subject: Re: [PATCH] ath6kl: wmi: prevent a shift wrapping bug in ath6kl_wmi_delete_pstream_cmd()
Message-Id: <20200922074658.67A00C43385@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918142732.GA909725@mwanda>
In-Reply-To: <20200918142732.GA909725@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "tsid" is a user controlled u8 which comes from debugfs.  Values
> more than 15 are invalid because "active_tsids" is a 16 bit variable.
> If the value of "tsid" is more than 31 then that leads to a shift
> wrapping bug.
> 
> Fixes: 8fffd9e5ec9e ("ath6kl: Implement support for QOS-enable and QOS-disable from userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6a950755cec1 ath6kl: wmi: prevent a shift wrapping bug in ath6kl_wmi_delete_pstream_cmd()

-- 
https://patchwork.kernel.org/patch/11785193/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
