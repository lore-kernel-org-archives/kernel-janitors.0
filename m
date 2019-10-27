From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 27 Oct 2019 06:55:15 +0000
Subject: Re: [PATCH] media: aspeed-video: Fix memory leaks in aspeed_video_probe
Message-Id: <bec85427-66b8-e0fa-9ee2-07cc77cf4a7e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191026042519.29446-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191026042519.29446-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Kangjie Lu <kjlu@umn.edu>, Eddie James <eajames@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Joel Stanley <joel@jms.id.au>, Stephen McCamant <smccaman@umn.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>

…
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1663,18 +1663,24 @@ static int aspeed_video_probe(struct platform_device *pdev)
…
> +free_video:
> +	kfree(video);
…

I am curious if there is a need for such a memory release at another place.
How do you think about to add this function call also to the implementation
of the function “aspeed_video_remove”?

Regards,
Markus
