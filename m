From: Roland Dreier <roland@love-shack.home.digitalvampire.org>
Date: Tue, 28 Mar 2006 18:41:04 +0000
Subject: Re: [KJ] 2.6.16-post section mismatches
Message-Id: <87vetys98f.fsf@love-shack.home.digitalvampire.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53231717416718993=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060327155232.345bed3d.rdunlap@xenotime.net>
In-Reply-To: <20060327155232.345bed3d.rdunlap@xenotime.net>
To: kernel-janitors@vger.kernel.org

--===============53231717416718993==
Content-Type: text/plain; charset=us-ascii

 > WARNING: drivers/infiniband/hw/mthca/ib_mthca.o - Section mismatch: reference to .exit.text:mthca_unmap_eq_icm from .text between 'mthca_free_icms' (at offset 0x8e) and 'mthca_close_hca'

Thanks, I will send a fix for this to Linus.

 - R.

--===============53231717416718993==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53231717416718993==--
