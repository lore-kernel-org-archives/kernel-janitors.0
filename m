From: Kalle Valo <kvalo@adurom.com>
Date: Sat, 18 Dec 2010 09:12:10 +0000
Subject: Re: [patch -next] wl1251: wl12xx_get_platform_data() returns an ERR_PTR
Message-Id: <8762urigwl.fsf@purkki.adurom.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101218085210.GO1639@bicker>
In-Reply-To: <20101218085210.GO1639@bicker> (Dan Carpenter's message of "Sat\, 18 Dec 2010 11\:52\:10 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> writes:

> wl12xx_get_platform_data() returns an ERR_PTR on failure and it never
> returns a NULL.

Yes, that's true. Good that you found this.

> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Kalle Valo <kvalo@adurom.com>

-- 
Kalle Valo
