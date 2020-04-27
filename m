From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 27 Apr 2020 06:50:43 +0000
Subject: Re: [v2 2/3] net: qrtr: Add MHI transport layer
Message-Id: <6affe7d6-4aa1-cd72-74bf-69d8f6c3c98a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85591553-f1f2-a7c9-9c5a-58f74ebeaf38@web.de>
 <20200427054023.GA3311@Mani-XPS-13-9360>
In-Reply-To: <20200427054023.GA3311@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Chris Lew <clew@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hemant Kumar <hemantk@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>

>> I propose again to add a jump target so that a bit of exception handling code
>> can be better reused at the end of this function implementation.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=b2768df24ec400dd4f7fa79542f797e904812053#n450
>>
>
> Matter of taste! goto's are really useful if there are multiple exit paths
> available. But in this case there is only one and I don't think we may add
> anymore in future. So I'll keep it as it is.

Do you hope that an other optimiser software will avoid duplicate code
like kfree_skb(skb) calls from if branches?

Regards,
Markus
