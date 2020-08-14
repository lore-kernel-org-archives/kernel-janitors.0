From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 14 Aug 2020 10:29:27 +0000
Subject: Re: AW: [PATCH] ath6kl: prevent potential array overflow in ath6kl_add_new_sta()
Message-Id: <874kp5msfs.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813141315.GB457408@mwanda>
        <61e34f670a4845f8b1cbf6f6013f8a35@bfs.de>
In-Reply-To: <61e34f670a4845f8b1cbf6f6013f8a35@bfs.de> (Walter Harms's message
        of "Fri, 14 Aug 2020 08:49:43 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jakub Kicinski <kuba@kernel.org>, Jouni Malinen <jouni@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Walter Harms <wharms@bfs.de> writes:

> the debugtrace will give the impression that the function is 
> running. perhaps it is more clever to have this after the check.

But it's possible to deduce from the debug message that aid is out of
limit, so I prefer the way Dan did it.

Please don't top post. Also your mails are not visible in patchwork and
are easily missed, most likely due to using "AW:" in the subject.

https://patchwork.kernel.org/patch/11712551/

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
