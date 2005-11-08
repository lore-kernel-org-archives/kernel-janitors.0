From: Christoph Lameter <clameter@engr.sgi.com>
Date: Tue, 08 Nov 2005 18:59:46 +0000
Subject: [KJ] Re: [PATCH 8/8] Inline 3 functions
Message-Id: <Pine.LNX.4.62.0511081058580.30907@schroedinger.engr.sgi.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12576593989850204=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF894.8090204@us.ibm.com>
 <Pine.LNX.4.58.0511080937060.9530@sbz-30.cs.Helsinki.FI>
In-Reply-To: <Pine.LNX.4.58.0511080937060.9530@sbz-30.cs.Helsinki.FI>
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: Matthew Dobson <colpatch@us.ibm.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============12576593989850204==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 8 Nov 2005, Pekka J Enberg wrote:

> On Mon, 7 Nov 2005, Matthew Dobson wrote:
> > I found three functions in slab.c that have only 1 caller (kmem_getpages,
> > alloc_slabmgmt, and set_slab_attr), so let's inline them.
> 
> Why? They aren't on the hot path and I don't see how this is an 
> improvement...

It avoids the call/return sequences so it may decrease code size a bit and 
allow the compiler (if its up to the task) to do more CSE optimizations.


--===============12576593989850204==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12576593989850204==--
