From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 24 Nov 2011 12:29:45 +0000
Subject: Re: [patch v2] ath6kl: use a larger buffer for debug output
Message-Id: <4ECE38B9.4080902@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111118140906.GA9685@elgon.mountain> <1321625461.10266.57.camel@jlt3.sipsolutions.net> <20111123063450.GA3363@mwanda>
In-Reply-To: <20111123063450.GA3363@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/23/2011 08:34 AM, Dan Carpenter wrote:
> The return value of snprintf() is the number of bytes which would
> have been copied if there was enough space, but we want the number of
> bytes actually copied.  The scnprintf() function does this.
> 
> Also in theory, a %u can take take 10 digits so we may as well make
> the buffer larger as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

> v2:  I didn't know about the scnprintf() function before.  Thanks
> Johannes.

Me neither, so thank you from me as well :)

Kalle
