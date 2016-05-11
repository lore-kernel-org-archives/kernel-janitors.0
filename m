From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 11 May 2016 19:03:34 +0000
Subject: Re: atmel: potential underflow in atmel_set_freq()
Message-Id: <20160511190334.5797D61322@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160510192117.GC30712@mwanda>
References: <20160510192117.GC30712@mwanda>
In-Reply-To: <20160510192117.GC30712@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Simon Kelley <simon@thekelleys.org.uk>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Smatch complains that we cap the upper bound of "fwrq->m" but not the
> lower bound.  I don't know if it can actually happen but it's simple
> enough to check for negatives.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, 1 patch applied to wireless-drivers-next.git:

d9739a26fbca atmel: potential underflow in atmel_set_freq()

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9061371/

