From: Dave Airlie <airlied@gmail.com>
Date: Thu, 07 Jan 2010 03:47:31 +0000
Subject: Re: [PATCH] drm/radeon/radeon_cp.c: fix resource leak on error
Message-Id: <21d7e9971001061947i210908br839b7633a1c0fad3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1262136345.8733.36.camel@ICE-BOX>
In-Reply-To: <1262136345.8733.36.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 30, 2009 at 11:25 AM, Darren Jenkins
<darrenrjenkins@gmail.com> wrote:
> If drm_addmap() fails master_priv is leaked.
>

I got a patch from Roel Kluin to fix this already, will push it out soon.

Dave.
