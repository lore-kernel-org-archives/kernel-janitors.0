From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2020 11:17:54 +0000
Subject: Re: [PATCH] ath6kl: prevent potential array overflow in ath6kl_add_new_sta()
Message-Id: <20200814111753.GQ1793@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813141315.GB457408@mwanda>
 <61e34f670a4845f8b1cbf6f6013f8a35@bfs.de>
In-Reply-To: <61e34f670a4845f8b1cbf6f6013f8a35@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, Jouni Malinen <jouni@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Aug 14, 2020 at 08:49:43AM +0000, Walter Harms wrote:
> nitpicking:
> 
> the debugtrace will give the impression that the function is 
> running. perhaps it is more clever to have this after the check.
> 

The debug is more useful they way I did it.  Otherwise it doesn't
print anything.  This is also the normal way to do this sort of
debugging.

regards,
dan carpenter
