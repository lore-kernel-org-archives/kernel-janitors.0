From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 23 Oct 2006 19:18:15 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling
Message-Id: <1161631095.22348.4.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	 <1161625164.21701.18.camel@localhost.localdomain>
	 <20061023175427.GB23714@hmsreliant.homelinux.net>
In-Reply-To: <20061023175427.GB23714@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, akpm@osdl.org, benh@kernel.crashing.org, maxk@qualcomm.com, linux-kernel@vger.kernel.org

Ar Llu, 2006-10-23 am 13:54 -0400, ysgrifennodd Neil Horman:
> On Mon, Oct 23, 2006 at 06:39:24PM +0100, Alan Cox wrote:
> New patch attached, taking Alan's suggestions into account.  I'll consolidate
> the printk error messages into misc_register in a later patch when I have a
> moment.  Thanks Alan.
> Signed-off-by: Neil Horman <nhorman@tuxdriver.com>

Acked-by: Alan Cox <alan@redhat.com>


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
