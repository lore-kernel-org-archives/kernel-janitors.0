From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Wed, 28 Aug 2013 17:01:37 +0000
Subject: Re: [PATCH v3] xHCI: Fixing xhci_readl definition and function call
Message-Id: <20130828170137.GB26483@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377482937-7486-1-git-send-email-kumargauravgupta3@gmail.com>
 <20130828071304.GO6329@mwanda>
 <521E1292.5060709@gmail.com>
In-Reply-To: <521E1292.5060709@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 28, 2013 at 08:39:06PM +0530, Kumar Gaurav wrote:
> On Wednesday 28 August 2013 12:43 PM, Dan Carpenter wrote:
> >On Mon, Aug 26, 2013 at 07:38:57AM +0530, Kumar Gaurav wrote:
> I've started cloning linux-next and as it's not applying on
> linux-next, I'll try it on linux-next (once i cloned it)  and will
> send again.

Yeah, this doesn't apply against Greg's usb-next tree, so I can't take
it.  If you're sending non-bug fixes in, you need to base your patches
against that tree, or linux-next.

Sarah Sharp
