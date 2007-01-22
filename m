From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 22 Jan 2007 10:00:06 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <Pine.LNX.4.64.0701220455210.22098@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 22 Jan 2007, Richard Knutsson wrote:

> Is the script also checking for booleans defined by "#define" or
> "enum" (without typedef)?

here's a list of files that insist on defining their own boolean
values of some kind using enums:

./drivers/net/wireless/strip.c:enum { FALSE = 0, TRUE = 1 };

./arch/arm/nwfpe/milieu.h-enum {
./arch/arm/nwfpe/milieu.h-    FALSE = 0,
./arch/arm/nwfpe/milieu.h:    TRUE  = 1
./arch/arm/nwfpe/milieu.h-};

./arch/arm26/nwfpe/milieu.h-enum {
./arch/arm26/nwfpe/milieu.h-    FALSE = 0,
./arch/arm26/nwfpe/milieu.h:    TRUE  = 1
./arch/arm26/nwfpe/milieu.h-};

./fs/xfs/linux-2.6/xfs_vnode.h:typedef enum { L_FALSE, L_TRUE } lastclose_t;


rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
