From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 22 May 2019 10:00:04 +0000
Subject: Re: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with less than zero
Message-Id: <dcb1f2d8-5894-ee7a-6413-ad6f596da888@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190522082627.18354-1-colin.king@canonical.com>
 <20190522095317.GT31203@kadam>
In-Reply-To: <20190522095317.GT31203@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/05/2019 10:53, Dan Carpenter wrote:
> No.  This isn't the right fix.  We should declare them as int instead.

Doh, brown paper bag time. I'll do a V2.

> 
> regards,
> dan carpenter
> 
