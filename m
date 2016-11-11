From: Jiri Benc <jbenc@redhat.com>
Date: Fri, 11 Nov 2016 13:12:03 +0000
Subject: Re: [bug report] vxlan: keep flags and vni in network byte order
Message-Id: <20161111141203.1fbce460@griffin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161111124941.GA3991@mwanda>
In-Reply-To: <20161111124941.GA3991@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Nov 2016 14:05:09 +0100, Jiri Benc wrote:
> The static checker clearly can't understand endian conversion macros.
> VXLAN_VNI_MASK is:
> 
> cpu_to_be32(VXLAN_VID_MASK << 8)
> 
> Thus on little endian, it becomes 0x00ffffff.

Btw, until the unspecified static checker you used is not fixed to
resolve such macros correctly, it can't be really used to check the
kernel source, yet alone to generate bug reports. It will trip over
false positive in gazillion places.

 Jiri
