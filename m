From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Tue, 08 Nov 2005 08:48:11 +0000
Subject: Re: [KJ] Re: [PATCH 2/8] Use 'nid' in slab.c
Message-Id: <a01a16b50511080048j7c260597gcc6fd0084e32e41c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0511080952250.10193@sbz-30.cs.Helsinki.FI>
In-Reply-To: <Pine.LNX.4.58.0511080952250.10193@sbz-30.cs.Helsinki.FI>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/8/05, Pekka J Enberg <penberg@cs.helsinki.fi> wrote:
> On Mon, 7 Nov 2005, Matthew Dobson wrote:
> > We refer to a node number as: "nodeid", "node", "nid", and possibly oth=
er
> > names.  Let's choose one, and I choose "nid".
>
> Such a pity as nodeid is much more readable...
>

I second that, nodeid is much more understandable.

One thing I noticed while reading the patch is that the function/macro
"cpu_to_node"
probably also should be renamed to "cpu_to_nodeid" (or "cpu_to_nid").
Also numa_node_id --> numa_nodeid I guess?

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
