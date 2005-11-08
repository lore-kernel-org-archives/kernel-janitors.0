From: Christoph Lameter <clameter@engr.sgi.com>
Date: Tue, 08 Nov 2005 19:09:31 +0000
Subject: [KJ] Re: [PATCH 4/8] Cleanup kmem_cache_create()
Message-Id: <Pine.LNX.4.62.0511081108340.31060@schroedinger.engr.sgi.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69617442543666908=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF70D.6040604@us.ibm.com>
 <52mzkfrily.fsf@cisco.com> <Pine.LNX.4.62.0511081049520.30907@schroedinger.engr.sgi.com>
 <4370F6BB.1070409@us.ibm.com>
In-Reply-To: <4370F6BB.1070409@us.ibm.com>
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: Roland Dreier <rolandd@cisco.com>, kernel-janitors@lists.osdl.org, Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

--===============69617442543666908==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 8 Nov 2005, Matthew Dobson wrote:

> > A large object in terms of this patch is a object greater than 4096 bytes 
> > not an object greater than PAGE_SIZE. I think the absolute size is 
> > desired.
> Would you be OK with at least NAMING the constant?  I won't name it
> PAGE_SIZE (of course), but LARGE_OBJECT_SIZE or something?

Ask Manfred about this. I think he coded it that way and he usually has 
good reasons for it.

Thanks for the cleanup work!


--===============69617442543666908==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69617442543666908==--
