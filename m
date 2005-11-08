From: Pekka J Enberg <penberg@cs.Helsinki.FI>
Date: Tue, 08 Nov 2005 07:34:48 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <Pine.LNX.4.58.0511080932460.9530@sbz-30.cs.Helsinki.FI>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86212619876124696=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com>
 <52mzkfrily.fsf@cisco.com>
In-Reply-To: <52mzkfrily.fsf@cisco.com>
To: Roland Dreier <rolandd@cisco.com>
Cc: Matthew Dobson <colpatch@us.ibm.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============86212619876124696==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 7 Nov 2005, Roland Dreier wrote:

>     > * Replace a constant (4096) with what it represents (PAGE_SIZE)
> 
> This seems dangerous.  I don't pretend to understand the slab code,
> but the current code works on architectures with PAGE_SIZE != 4096.
> Are you sure this change is correct?

Looks ok to me except that it should be a separate patch (it is not a 
trivial cleanup because it changes how the code works).

			Pekka

--===============86212619876124696==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86212619876124696==--
