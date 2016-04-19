From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Date: Tue, 19 Apr 2016 15:47:53 +0000
Subject: Re: [patch v2] ath10k: add some sanity checks
Message-Id: <87vb3diore.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160411081520.GA17911@mwanda>
In-Reply-To: <20160411081520.GA17911@mwanda> (Dan Carpenter's message of "Mon, 
 11 Apr 2016 11:15:20 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch complains that since "ev->peer_id" comes from skb->data that
> means we can't trust it and have to do a bounds check on it to prevent
> an array overflow.
>
> Fixes: 6942726f7f7b ('ath10k: add fast peer_map lookup')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Kalle Valo