From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2019 08:28:31 +0000
Subject: Re: [PATCH 1/4] misc: xilinx_sdfec: Fix a couple small information leaks
Message-Id: <20190822082831.GH3964@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821070606.GA26957@mwanda>
 <58e9a151-3d92-c730-eea6-5cfde90934a4@xilinx.com>
In-Reply-To: <58e9a151-3d92-c730-eea6-5cfde90934a4@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Simek <michal.simek@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>, linux-arm-kernel@lists.infradead.org

On Thu, Aug 22, 2019 at 10:14:12AM +0200, Michal Simek wrote:
> Hi Dan,
> 
> On 21. 08. 19 9:06, Dan Carpenter wrote:
> > These structs have holes in them so we end up disclosing a few bytes of
> > uninitialized stack data.
> > 
> > drivers/misc/xilinx_sdfec.c:305 xsdfec_get_status() warn: check that 'status' doesn't leak information (struct has a hole after 'activity')
> > drivers/misc/xilinx_sdfec.c:449 xsdfec_get_turbo() warn: check that 'turbo_params' doesn't leak information (struct has a hole after 'scale')
> 
> Who is generating these warnings? Is this any new GCC or different tool?
> I see that 3byte padding but never seen these warnings.

This is a Smatch check.

regards,
dan carpenter
