From: Anton Vorontsov <anton@enomsg.org>
Date: Wed, 13 Nov 2013 06:39:39 +0000
Subject: Re: [patch] pm2301-charger: remove unneeded NULL checks
Message-Id: <20131113063939.GA31149@teo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080617.GQ21844@elgon.mountain>
In-Reply-To: <20131107080617.GQ21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 07, 2013 at 11:06:17AM +0300, Dan Carpenter wrote:
> If "pm2" were NULL we would oops printing the error message.
> Fortunately, that's not possible so I have removed the NULL checks.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
