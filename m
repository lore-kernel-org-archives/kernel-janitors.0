From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 03 Mar 2015 13:42:59 +0000
Subject: Re: rtlwifi: rtl8188ee: missing curly braces in handle_branch1()
Message-Id: <20150303134259.75697140C64@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150225132451.GL19745@mwanda>
References: <20150225132451.GL19745@mwanda>
In-Reply-To: <20150225132451.GL19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Chaoming Li <chaoming_li@realsil.com.cn>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> From the indenting, it seems like the READ_NEXT_PAIR() was supposed to
> be inside the while loop.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
