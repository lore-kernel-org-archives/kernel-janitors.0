From: Roland Dreier <rolandd@cisco.com>
Date: Tue, 08 Nov 2005 02:14:33 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <52mzkfrily.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com>
In-Reply-To: <436FF70D.6040604@us.ibm.com> (Matthew Dobson's message of
 "Mon, 07 Nov 2005 16:53:33 -0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

    > * Replace a constant (4096) with what it represents (PAGE_SIZE)

This seems dangerous.  I don't pretend to understand the slab code,
but the current code works on architectures with PAGE_SIZE != 4096.
Are you sure this change is correct?

 - R.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
