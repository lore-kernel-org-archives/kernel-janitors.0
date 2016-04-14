From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Date: Thu, 14 Apr 2016 14:43:02 +0000
Subject: Re: [patch v2] ath10k: add some sanity checks
Message-Id: <87vb3kqmiz.fsf@kamboji.qca.qualcomm.com>
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

In ath.git pending branch I modified the title to be a bit more unique:

    ath10k: add some sanity checks to peer_map_event() functions

> ---
> v2: Add a warning message.  There is a checkpatch.pl warning that
> the alignment should match the open parenthesis but I ignored it because
> we're going off the end of the 80 character limit and this way is fine.

In ath10k we have used 90 char limit so I fixed this in the pending
branch. And actually I don't think checkpatch complains about the
message format string length of a logging function like ath10k_warn().

-- 
Kalle Valo