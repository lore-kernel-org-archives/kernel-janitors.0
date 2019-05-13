From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Mon, 13 May 2019 11:17:14 +0000
Subject: Re: [PATCH] Staging: vc04_services: Fix a couple error codes
Message-Id: <bdb03bff-f5e5-ef29-b009-ff9072347af1@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190513110718.GA15764@mwanda>
In-Reply-To: <20190513110718.GA15764@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 13.05.19 13:07, Dan Carpenter wrote:
> These are accidentally returning positive EINVAL instead of negative
> -EINVAL.  Some of the callers treat positive values as success.
>
> Fixes: 7b3ad5abf027 ("staging: Import the BCM2835 MMAL-based V4L2 camera driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
