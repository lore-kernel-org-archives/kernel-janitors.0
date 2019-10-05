From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 05 Oct 2019 18:40:35 +0000
Subject: Re: [PATCH] staging: vt6655: Fix memory leak in vt6655_probe
Message-Id: <20191005184035.GA2062613@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004200319.22394-1-navid.emamdoost@gmail.com>
 <1d0ba4c6-99ed-e2c9-48a2-ce34b0042876@web.de>
In-Reply-To: <1d0ba4c6-99ed-e2c9-48a2-ce34b0042876@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: devel@driverdev.osuosl.org, Malcolm Priestley <tvboxspy@gmail.com>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Madhumitha Prabakaran <madhumithabiw@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Forest Bond <forest@alittletooquiet.net>, Stephen McCamant <smccaman@umn.edu>, Navid Emamdoost <navid.emamdoost@gmail.com>

On Sat, Oct 05, 2019 at 06:30:13PM +0200, Markus Elfring wrote:
> > In vt6655_probe, if vnt_init() fails the cleanup code needs to be called
> > like other error handling cases. The call to device_free_info() is
> > added.
> 
> Please improve this change description.

It is fine as-is, please do not confuse people.
