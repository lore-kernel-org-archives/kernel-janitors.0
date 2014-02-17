From: Dave Jones <davej@redhat.com>
Date: Mon, 17 Feb 2014 19:59:19 +0000
Subject: Re: [patch 1/2] staging/bcm: two information leaks in ioctl
Message-Id: <20140217195919.GA26373@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140217195606.GA32630@elgon.mountain>
In-Reply-To: <20140217195606.GA32630@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 17, 2014 at 10:56:06PM +0300, Dan Carpenter wrote:
 > There are a couple paths where we don't check how much data we copy back
 > to the user.

I'm curious, is this something smatch is only picking up now that
I chopped up that mega function into lots of little functions ?

	Dave


