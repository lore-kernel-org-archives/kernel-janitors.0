From: Cyrill Gorcunov <gorcunov@openvz.org>
Date: Sun, 07 Oct 2012 21:36:38 +0000
Subject: Re: kernel/sys.c:1868:2: warning: passing argument 2 of 'access_ok' makes pointer from integer witho
Message-Id: <20121007213638.GB16273@moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121007002016.GA5678@localhost>
In-Reply-To: <20121007002016.GA5678@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 07, 2012 at 08:20:16AM +0800, Fengguang Wu wrote:
> Hi Cyrill,
> 
> FYI, there are new compile warnings show up in
> 
> commit: 20e61e149ba9a4fe4c4867a76e399879d802e669  prctl: use access_ok() instead of TASK_SIZE in prctl_set_mm()
> config: m68k-allmodconfig

Hi Fengguang,

yeah, I know. This commit was being dropped by Andrew Morton, so I rather
simply wait now until I move my tree on new -rc (once it's out) and
this commit will dissapear.

	Cyrill
