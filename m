From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Mon, 25 Mar 2019 09:04:34 +0000
Subject: Re: [PATCH] staging: vc04_services: Fix an error code in vchiq_probe()
Message-Id: <72bd8d42-d36b-f559-2a64-e9cf11ac2ff0@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325085659.GA16023@kadam>
In-Reply-To: <20190325085659.GA16023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am 25.03.19 um 09:56 schrieb Dan Carpenter:
> We need to set "err" on this error path.
>
> Fixes: 187ac53e590c ("staging: vchiq_arm: rework probe and init functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

Thanks
