From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Nov 2016 13:27:08 +0000
Subject: Re: [bug report] vxlan: keep flags and vni in network byte order
Message-Id: <20161111132708.GJ28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161111124941.GA3991@mwanda>
In-Reply-To: <20161111124941.GA3991@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 11, 2016 at 02:12:03PM +0100, Jiri Benc wrote:
> On Fri, 11 Nov 2016 14:05:09 +0100, Jiri Benc wrote:
> > The static checker clearly can't understand endian conversion macros.
> > VXLAN_VNI_MASK is:
> > 
> > cpu_to_be32(VXLAN_VID_MASK << 8)
> > 
> > Thus on little endian, it becomes 0x00ffffff.

Ah right.

> 
> Btw, until the unspecified static checker you used is not fixed to
> resolve such macros correctly, it can't be really used to check the
> kernel source, yet alone to generate bug reports. It will trip over
> false positive in gazillion places.

Nope.  Just this one.

regards,
dan carpenter

