From: Christoph Lameter <clameter@engr.sgi.com>
Date: Tue, 08 Nov 2005 18:52:53 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <Pine.LNX.4.62.0511081049520.30907@schroedinger.engr.sgi.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31718874300462074=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com>
 <52mzkfrily.fsf@cisco.com>
In-Reply-To: <52mzkfrily.fsf@cisco.com>
To: Roland Dreier <rolandd@cisco.com>
Cc: Matthew Dobson <colpatch@us.ibm.com>, kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

--===============31718874300462074==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 7 Nov 2005, Roland Dreier wrote:

>     > * Replace a constant (4096) with what it represents (PAGE_SIZE)
> 
> This seems dangerous.  I don't pretend to understand the slab code,
> but the current code works on architectures with PAGE_SIZE != 4096.
> Are you sure this change is correct?

Leave the constant. The 4096 is only used for debugging and is a boundary 
at which redzoning and last user accounting is given up.

A large object in terms of this patch is a object greater than 4096 bytes 
not an object greater than PAGE_SIZE. I think the absolute size is 
desired.

Would you CC manfred on all your patches?




--===============31718874300462074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31718874300462074==--
