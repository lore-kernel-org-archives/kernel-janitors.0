From: "Myklebust, Trond" <Trond.Myklebust@netapp.com>
Date: Thu, 20 Sep 2012 12:17:27 +0000
Subject: RE: [nfs:testing 13/18] nfs4proc.c:(.text+0x157ca4): undefined reference to `pnfs_put_layout_hdr'
Message-Id: <4FA345DA4F4AE44899BD2B03EEEC2FA908FDA695@SACEXCMBX04-PRD.hq.netapp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919233551.GE5607@localhost>
In-Reply-To: <20120919233551.GE5607@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>

> -----Original Message-----
> From: Fengguang Wu [mailto:fengguang.wu@intel.com]
> Sent: Wednesday, September 19, 2012 7:36 PM
> To: Myklebust, Trond
> Cc: kernel-janitors@vger.kernel.org; linux-nfs@vger.kernel.org
> Subject: [nfs:testing 13/18] nfs4proc.c:(.text+0x157ca4): undefined
> reference to `pnfs_put_layout_hdr'
> 
> Hi Trond,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
> head:   c5d13e10816a6c758d31f291c86ad2ef16c8620a
> commit: 588b33511b85dd532ef5630ba6b6e3982b8e170d [13/18] NFSv4.1:
> Cleanup; add "pnfs_" prefix to get_layout_hdr() and put_layout_hdr()
> config: i386-allyesconfig
> 

Thank you Fengguang!  I've fixed this up in today's tree.

Cheers
   Trond
