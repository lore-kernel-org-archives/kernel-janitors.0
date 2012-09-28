From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Date: Fri, 28 Sep 2012 10:25:24 +0000
Subject: Re: [tip:master 30/35] mm/memory.c:72:2: warning: #warning Unfortunate NUMA config, growing page-fra
Message-Id: <1348827924.3292.70.camel@twins>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928095526.GA28747@localhost>
In-Reply-To: <20120928095526.GA28747@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2012-09-28 at 17:55 +0800, Fengguang Wu wrote:
> Hi Peter,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> head:   2ef756a2e79149dc84c88f7ccc42ec38cbb7722e
> commit: 835e3cf29f4eeba6c5c8bcc188b2138029157938 [30/35] mm: Fold page::nid_last into page::flags when possible
> config: i386-allmodconfig
> 
> All warnings:
> 
> mm/memory.c:72:2: warning: #warning Unfortunate NUMA config, growing page-frame for last_nid. [-Wcpp]

Yeah, 32bit NUMA config.. nobody sane should be doing or using that.

The other option was to hard-disable 32bit support for SCHED_NUMA, which
I wouldn't mind either.. who gives about 32 bits computing anyway ;-)


