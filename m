From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 21 Nov 2011 16:21:47 +0000
Subject: Re: [patch] ath6kl: unlock if ath6kl_cfg80211_connect() fails
Message-Id: <4ECA7A9B.3070501@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111118140932.GB9685@elgon.mountain>
In-Reply-To: <20111118140932.GB9685@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kevin Fang <chienf@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/18/2011 04:09 PM, Dan Carpenter wrote:
> There is an unlock missing on this error path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to ath6kl.git. There was a conflict but that was easy to
fix.

Kalle
