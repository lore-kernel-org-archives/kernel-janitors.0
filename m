From: Sebastian Reichel <sre@kernel.org>
Date: Sun, 05 Apr 2015 12:47:19 +0000
Subject: Re: [PATCH 6/16] HSI: cmt_speech: fix error return code
Message-Id: <20150405124719.GA9186@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
 <1428235596-4757-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-7-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julia,

On Sun, Apr 05, 2015 at 02:06:26PM +0200, Julia Lawall wrote:
> Return a negative error code on failure.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: [...]

Thanks, applied:

https://git.kernel.org/cgit/linux/kernel/git/sre/linux-hsi.git/commit/?h=3D=
for-next&id=3D265ef3ee9575e6d150f485d28dbe153a50d27f4c

-- Sebastian

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVIS7LAAoJENju1/PIO/qaMLIQAJnkohGRjhk5Ux3az/Fu8MI9
Ygctbxyatzl9I/5znpF1qBsat7gU0Qg/kcKXExYfiojq3u7CqV/KACeUGb15JgDz
RKoBgDLbnWxWs3VipHtaYqCPhkPv913Uajb28kUGyC0wbAh58o3dovuMTlwRv6zk
cNYUge5kbI6r8TMPZHjlsW2S79BuecGu3Ua0r7RcNUy5xG7qg9KtI6rNfMWHu0UQ
lUtnv9W53F1BW+ZioUqeZ1TpoO0BpA4mK1vOyhnsz1sZ5VnGA7y+36G4yN8XfZDU
i5yAU9N3oYEAFStkelLDF+x0DWPtaIVgQ5OsqdX4o7lCYqWo6oZa1BOqZhXcpss2
PV15l/vqYhZHhrEmAxO3zsEOgRaPvagA+z1URd494gU3uireU/qEkPLuPCTAkF9O
VM/OVEmA92hAaTUvFyQza3t0PmMLcNQDTC3SFheDIIU4lgR4j5UZ1PJcBC5+Wta5
bUN9g3BHF/+i1jqDvELmNFfDNlqRXFbRP0JR1Y3WiAooE/ZULaZT/PTG6/ON2Vq5
gicStFp1yihmGd+iQppKB/SSxm9wqhj5wm9Q/4zcK8HV8o3njV4M1f3dWiEXr7QF
aTvWsafznC9Vg3S83uiK7/vdcRsdL+u4Q/ZCAmB2/ESw1yV3YNzh7XgIUltuFMuF
PHsEwK5Wf1ueG1XdgXWu
=/9fN
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
