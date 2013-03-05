From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 05 Mar 2013 07:53:29 +0000
Subject: Re: [patch] ath6kl: small cleanup in ath6kl_htc_pipe_rx_complete()
Message-Id: <874ngqgu4m.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130228044547.GC15239@longonot.mountain>
In-Reply-To: <20130228044547.GC15239@longonot.mountain> (Dan Carpenter's
	message of "Thu, 28 Feb 2013 07:45:47 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath6kl-devel@qca.qualcomm.com

Dan Carpenter <dan.carpenter@oracle.com> writes:

> It's harmless, but Smatch complains if we use "htc_hdr->eid" before
> doing the bounds check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

-- 
Kalle Valo
