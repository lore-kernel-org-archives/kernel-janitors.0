From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 18 Jan 2019 09:30:18 +0000
Subject: Re: [PATCH net-next] virt_wifi: fix error return code in virt_wifi_newlink()
Message-Id: <87fttqpb2t.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547796592-99034-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547796592-99034-1-git-send-email-weiyongjun1@huawei.com> (Wei
        Yongjun's message of "Fri, 18 Jan 2019 07:29:52 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Cody Schuffelen <schuffelen@google.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: c7cdba31ed8b ("mac80211-next: rtnetlink wifi simulation device")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

BTW, virt_wifi patches go through mac80211-next, not via net-next.

-- 
Kalle Valo
