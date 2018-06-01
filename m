From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 01 Jun 2018 15:52:51 +0000
Subject: Re: [PATCH] qtnfmac: fix NULL pointer dereference
Message-Id: <87muwezep8.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601132408.GA2572@embeddedor.com>
In-Reply-To: <20180601132408.GA2572@embeddedor.com> (Gustavo A. R. Silva's
        message of "Fri, 1 Jun 2018 08:24:08 -0500")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"Gustavo A. R. Silva" <gustavo@embeddedor.com> writes:

> In case *vif* is NULL at 655: if (!vif), the execution path jumps to
> label out, where *vif* is dereferenced at 679:
>
> if (vif->sta_state = QTNF_STA_CONNECTING)
>
> Fix this by immediately returning when *vif* is NULL instead of
> jumping to label out.
>
> Addresses-Coverity-ID: 1469567 ("Dereference after null check")
> Fixes: 480daa9cb62c ("qtnfmac: fix invalid STA state on EAPOL failure")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

As commit 480daa9cb62c was recently applied to wireless-drivers-next
I'll queue this to 4.18.

-- 
Kalle Valo
