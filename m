From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 15 Jun 2020 10:35:05 +0000
Subject: Re: [PATCH] media: pxa_camera: remove an impossible condition
Message-Id: <877dw8borq.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610172615.GD90634@mwanda>
In-Reply-To: <20200610172615.GD90634@mwanda> (Dan Carpenter's message of "Wed,
        10 Jun 2020 20:26:15 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chuhong Yuan <hslester96@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> It's not possible for "pcdev->mclk" to be zero because we check for
> that earlier and set it to 20000000 in that situation.  If it were
> possible, that would be a problem because it could have lead to an Oops
> in the error handling when we call v4l2_clk_unregister(pcdev->mclk_clk);
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
