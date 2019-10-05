From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 16:30:13 +0000
Subject: Re: [PATCH] staging: vt6655: Fix memory leak in vt6655_probe
Message-Id: <1d0ba4c6-99ed-e2c9-48a2-ce34b0042876@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004200319.22394-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004200319.22394-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, Malcolm Priestley <tvboxspy@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Madhumitha Prabakaran <madhumithabiw@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Forest Bond <forest@alittletooquiet.net>, Stephen McCamant <smccaman@umn.edu>

> In vt6655_probe, if vnt_init() fails the cleanup code needs to be called
> like other error handling cases. The call to device_free_info() is
> added.

Please improve this change description.

Regards,
Markus
