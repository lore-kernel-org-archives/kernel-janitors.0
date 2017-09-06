From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 06 Sep 2017 05:59:06 +0000
Subject: Re: [PATCH 0/6] [media] Atmel: Adjustments for seven function implementations
Message-Id: <20170906055906.pzhqxor7goybrdif@rfolt0960.corp.atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
 <30c46f61-5c4f-9f75-e8b5-fab77fe1e11f@Microchip.com>
In-Reply-To: <30c46f61-5c4f-9f75-e8b5-fab77fe1e11f@Microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Yang, Wenyou" <Wenyou.Yang@Microchip.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-media@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Songjun Wu <songjun.wu@microchip.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 06, 2017 at 08:58:26AM +0800, Yang, Wenyou wrote:
> Hi,
> 
> 
> On 2017/9/5 4:04, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 4 Sep 2017 21:44:55 +0200
> > 
> > A few update suggestions were taken into account
> > from static source code analysis.
> Thank you for your patches.
> 
> You can add my Acked-by for the patch series.
> 
> Acked-by: Wenyou Yang <wenyou.yang@microchip.com>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> 
> > 
> > Markus Elfring (6):
> >    Delete an error message for a failed memory allocation in isc_formats_init()
> >    Improve a size determination in isc_formats_init()
> >    Adjust three checks for null pointers
> >    Delete an error message for a failed memory allocation in two functions
> >    Improve three size determinations
> >    Adjust a null pointer check in three functions
> > 
> >   drivers/media/platform/atmel/atmel-isc.c | 12 +++++-------
> >   drivers/media/platform/atmel/atmel-isi.c | 20 ++++++++------------
> >   2 files changed, 13 insertions(+), 19 deletions(-)
> > 
> 
> Best Regards,
> Wenyou Yang
