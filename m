From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 05 Jul 2013 13:36:25 +0000
Subject: Re: [patch] ath10k: off by one sanity check
Message-Id: <87txk9f7s6.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130618072846.GC12329@elgon.mountain>
In-Reply-To: <20130618072846.GC12329@elgon.mountain> (Dan Carpenter's message
	of "Tue, 18 Jun 2013 10:28:46 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath9k-devel@lists.ath9k.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch. John already applied this to his wireless-next
tree.

-- 
Kalle Valo
