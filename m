From: walter harms <wharms@bfs.de>
Date: Sun, 18 Dec 2005 14:34:38 +0000
Subject: Re: [KJ] RFC: New todo for loops
Message-Id: <43A5737E.2040204@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051218142953.a30dcf5d.daniel.marjamaki@comhem.se>
In-Reply-To: <20051218142953.a30dcf5d.daniel.marjamaki@comhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi daniel,
  i do not like the idea. the code is harder to read and debug, smashing=20
pointers is easy done. i would not trade that for speed.

SFIK, array[i] is read as *(array+i) with c-compilers. nice example is=20
in "how to write unmaintainable code".


re,
  walter


Daniel Marjam=E4ki wrote:
> Hello friends!
>=20
> I have a suggestion for the TODO.
> Making loops faster is important. Therefore in the loops we should use po=
inters instead of arrays.
>=20
> Example (fs/reiser/file.c:268):
> 	int i;
> 	for (i =3D 0; i < blocks_to_allocate; i++)
> 		allocated_blocks[i] =3D cpu_to_le32(allocated_blocks[i]);
>=20
> This could be changed to something like:
> 	struct b_blocknr_t *block, *block_last;
> 	block_last =3D &allocated_blocks[allocated_blocks-1];
> 	for (block =3D allocated_blocks; block <=3D block_last; block++)
> 			*block =3D cpu_to_le32(*block);
>=20
> Best Regards,
> Daniel Marjam=E4ki
>=20
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>=20
>=20
>=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
