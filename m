From: Leon Romanovsky <leon@kernel.org>
Date: Mon, 14 Nov 2016 06:00:23 +0000
Subject: Re: [PATCH] IB/usnic: simplify IS_ERR_OR_NULL to IS_ERR
Message-Id: <20161114060023.GB4240@leon.nu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kORqDWCi7qDJ0mEj"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1478891066-16093-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1478891066-16093-1-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Christian Benvenuti <benve@cisco.com>, kernel-janitors@vger.kernel.org, Dave Goodell <dgoodell@cisco.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 11, 2016 at 08:04:26PM +0100, Julia Lawall wrote:
> The function usnic_ib_qp_grp_get_chunk only returns an ERR_PTR value or a
> valid pointer, never NULL.  The same is true of get_qp_res_chunk, which
> just returns the result of calling usnic_ib_qp_grp_get_chunk.  Simplify
> IS_ERR_OR_NULL to IS_ERR in both cases.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression t,e;
> @@
>
> t = \(usnic_ib_qp_grp_get_chunk(...)\|get_qp_res_chunk(...)\)
> ... when != t=e
> - IS_ERR_OR_NULL(t)
> + IS_ERR(t)
>
> @@
> expression t,e,e1;
> @@
>
> t = \(usnic_ib_qp_grp_get_chunk(...)\|get_qp_res_chunk(...)\)
> ... when != t=e
> ?- t ? PTR_ERR(t) : e1
> + PTR_ERR(t)
> ... when any
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, Julia.
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYKVL3AAoJEORje4g2clinKTUP+wV98kdPc1hsfSjPkgnqyRPS
P1fvUicQTLoPBZeh4Ota+wtNfTbKn60slZbs7gtqayBwRJN4sPoW8FsMp9LAknFq
+OGPaZTkENA1uut4Tbv4Eu+RU95YzUBrkcUc2KRa/eZY9tLewM6Bls9LGr4i6k9s
1vqmdBECitXLpdRFhy7uSPDLZBn3BwV402LHQAh4x8ZM8qpIHJKycGr26hLy91NI
a8m5lxWG/VnzOByXUb2pXBH+U5QiCUVGDgj0l+due2myiwKMHK9j9sElKE+gMYsf
MQSuRFX4o4cbXnXe1IgQE0oCAHbuXsWL/td7YgMEVC4m30WXd1XEcwldqudblYZp
gnxMD0tDUpCKUdmJb9hPCMYwpi4XtmQvwuFX933lD/lPAFwGyg1eZ6NDixqZDzYI
g4CrxW9Su8ytj+1nh8as4xBRAp/Ugk87iIhD4pWK/LLI+z3bjarjA6//kmmypon0
CA3FN1z0LP3BXlsSZkW/XdVhEF/3o0wGpbbO6TUJ7ppCH4WH9SKpfiJ4lIm5M9s8
rs3Mru6RiTmgdVPDsIU1yPSZAlu5lKAu76MWrKJEc/hsRjuHFJB8Kj0AsGbLdC3u
MtGljQnn6Hv8vBb4B1gIlG0xDECXSkxhhODZxZHHuqb4qoysYYd7J1p+GL8AdTjQ
we/nOtvGq1DhMQ7p3/m/
=CzY2
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
