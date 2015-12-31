From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 31 Dec 2015 13:13:16 +0000
Subject: Re: [patch] wil6210: fix a warning message condition
Message-Id: <87a8oqoj6b.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151216111000.GC21018@mwanda>
In-Reply-To: <20151216111000.GC21018@mwanda> (Dan Carpenter's message of "Wed,
	16 Dec 2015 14:10:00 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maya Erez <qca_merez@qca.qualcomm.com>, linux-wireless@vger.kernel.org, wil6210@qca.qualcomm.com, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> "iter" is -1 at the end of the loop and not zero.  It means we don't
> print a warning message.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to ath.git, thanks.

-- 
Kalle Valo
