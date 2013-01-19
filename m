From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Sat, 19 Jan 2013 17:49:00 +0000
Subject: Re: [PATCH 01/24] use IS_ENABLED() macro
Message-Id: <87txqdysfn.fsf@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358613206-4274-1-git-send-email-peter.senna@gmail.com> (Peter
	Senna Tschudin's message of "Sat, 19 Jan 2013 14:33:04 -0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: mchehab@redhat.com, hans.verkuil@cisco.com, jrnieder@gmail.com, emilgoode@gmail.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Peter Senna Tschudin <peter.senna@gmail.com> writes:

> replace:
>  #if defined(CONFIG_VIDEO_CX88_DVB) || \
>      defined(CONFIG_VIDEO_CX88_DVB_MODULE)
> with:
>  #if IS_ENABLED(CONFIG_VIDEO_CX88_DVB)
>
> This change was made for: CONFIG_VIDEO_CX88_DVB,
> CONFIG_VIDEO_CX88_BLACKBIRD, CONFIG_VIDEO_CX88_VP3054
>
> Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
>  drivers/media/pci/cx88/cx88.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

sorry, all patch-set have same 'use IS_ENABLED() macro'. not wise. at
least prefix it by subsystem, driver or whatever useful.

-- 
Nikola
