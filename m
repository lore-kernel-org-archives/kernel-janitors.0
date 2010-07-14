From: David Miller <davem@davemloft.net>
Date: Wed, 14 Jul 2010 22:07:39 +0000
Subject: Re: [PATCH 05/11] tulip: formatting of pointers in printk()
Message-Id: <20100714.150739.193711125.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279130568-10857-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279130568-10857-1-git-send-email-segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: grundler-6jwH94ZQLHl74goWV3ctuw@public.gmane.org, jpirko-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 22:02:47 +0400

> Use %p instead of %08x in printk().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Since patch #5 and #6 are doing the same change to different
files in the same driver, I combined them into one commit.

There is no need to split things up with so much granularity.
If it's all in the same driver, doing the same transformation,
keep it all in one patch.

Thanks.
