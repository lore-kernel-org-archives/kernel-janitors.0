From: Daniel =?ISO-8859-1?Q?Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Sun, 18 Dec 2005 13:29:53 +0000
Subject: [KJ] RFC: New todo for loops
Message-Id: <20051218142953.a30dcf5d.daniel.marjamaki@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hello friends!

I have a suggestion for the TODO.
Making loops faster is important. Therefore in the loops we should use poin=
ters instead of arrays.

Example (fs/reiser/file.c:268):
	int i;
	for (i =3D 0; i < blocks_to_allocate; i++)
		allocated_blocks[i] =3D cpu_to_le32(allocated_blocks[i]);

This could be changed to something like:
	struct b_blocknr_t *block, *block_last;
	block_last =3D &allocated_blocks[allocated_blocks-1];
	for (block =3D allocated_blocks; block <=3D block_last; block++)
			*block =3D cpu_to_le32(*block);

Best Regards,
Daniel Marjam=E4ki

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
