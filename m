From: "Carlo Perassi" <carlo@linux.it>
Date: Tue, 28 Jun 2005 13:47:25 +0000
Subject: Re: [KJ] [PATCH] bonding - a trailing whitespace
Message-Id: <53174.158.102.162.5.1119966445.squirrel@picard.linux.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050623193023.GF4398@voyager>
In-Reply-To: <20050623193023.GF4398@voyager>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Why not just
> 	static u32 arp_target[BOND_MAX_ARP_TARGETS];
> ... and include in the uninitialize static variables patch?

it is already included in
[PATCH] [RESEND] bonding - uninitialize static variables
Sat Jun 25 12:05:09 PDT 2005
http://lists.osdl.org/pipermail/kernel-janitors/2005-June/004268.html

-- 
Carlo Perassi - http://www.linux.it/~carlo/

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
