From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Wed, 11 Apr 2007 20:45:34 +0000
Subject: Re: [KJ] [PATCH]SPIN_LOCK_UNLOCKED cleanup in
Message-Id: <461D48EE.2090304@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070411175434.GA9110@arun.site>
In-Reply-To: <20070411175434.GA9110@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux1394-devel@lists.sourceforge.net, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, bcollins@debian.org

Milind Arun Choudhary wrote:
> SPIN_LOCK_UNLOCKED cleanup,use DEFINE_SPINLOCK instead 

Committed to linux1394-2.6.git. Thanks,
-- 
Stefan Richter
-===-=-== -=-- -=-=
http://arcgraph.de/sr/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
