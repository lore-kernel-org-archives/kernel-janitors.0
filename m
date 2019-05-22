From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 May 2019 09:53:17 +0000
Subject: Re: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with less than zero
Message-Id: <20190522095317.GT31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190522082627.18354-1-colin.king@canonical.com>
In-Reply-To: <20190522082627.18354-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

No.  This isn't the right fix.  We should declare them as int instead.

regards,
dan carpenter
