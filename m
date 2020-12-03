From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Date: Thu, 03 Dec 2020 13:30:05 +0000
Subject: Re: [PATCH] media: vidtv: fix use after free in vidtv_channel_si_destroy()
Message-Id: <2213CCBF-DD8A-4897-9CF7-3FBFA8520979@getmailspring.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8ilBh7cBIqSpP6Y@mwanda>
In-Reply-To: <X8ilBh7cBIqSpP6Y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>, "=?utf-8?Q?kernel-janitors=40vger.kernel.org?=" <kernel-janitors@vger.kernel.org>

Hi Dan,

> This code frees "m->si.pat" and then dereferences it on the next line.
> 
> Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)


IIRC there has been a similar patch [1] that has already been accepted
by Mauro..


[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20201127132832.15239-1-colin.king@canonical.com/

-- thanks
-- Daniel
