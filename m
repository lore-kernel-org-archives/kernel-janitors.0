From: "Girdwood, Liam" <lrg@ti.com>
Date: Wed, 19 Oct 2011 16:47:25 +0000
Subject: Re: [PATCH 3/3] sound/soc/au1x: keep pointer to resource so it can be freed
Message-Id: <CABS+qY2pBkNjHUKrtD3QttQOQD-LpStHopSGxzeG-iyc7RtVgw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1318909555-12933-3-git-send-email-julia@diku.dk>
	<CAOLZvyFoiuHEfpnozWpAM5h92rjay-asqXX0tY1P1ZzO8eTGOQ@mail.gmail.com>
In-Reply-To: <CAOLZvyFoiuHEfpnozWpAM5h92rjay-asqXX0tY1P1ZzO8eTGOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, Axel Lin <axel.lin@gmail.com>

On 19 October 2011 15:50, Manuel Lauss <manuel.lauss@googlemail.com> wrote:
> On Tue, Oct 18, 2011 at 5:45 AM, Julia Lawall <julia@diku.dk> wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Add a new variable for storing resources accessed subsequent to the one
>> accessed using request_mem_region, so the one accessed using
>> request_mem_region can be released if needed.
>>
>> This code is also missing some calls to iounmap.
>
> How about something much simpler, like this:
>
> From 940e38b3f0beff6fcd8f62f627dce622e9ca0e54 Mon Sep 17 00:00:00 2001
> From: Manuel Lauss <manuel.lauss@googlemail.com>
> Date: Wed, 19 Oct 2011 16:45:12 +0200
> Subject: [PATCH] ASoC: au1x: fix error paths in ac97c/i2cs probe callbacks.
>
> add iounmap() and release the correct mem resource.
>
> Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>

Acked-by: Liam Girdwood <lrg@ti.com>
