From: NeilBrown <neilb@suse.com>
Date: Wed, 14 Jun 2017 21:54:57 +0000
Subject: Re: [PATCH] reconnect_one(): fix a missing error code
Message-Id: <87lgou6xqm.fsf@notabene.neil.brown.name>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614093002.GG29394@elgon.mountain> <20170614203414.GC32208@fieldses.org>
In-Reply-To: <20170614203414.GC32208@fieldses.org>
To: "J. Bruce Fields" <bfields@fieldses.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "J. Bruce Fields" <bfields@redhat.com>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14 2017, J. Bruce Fields wrote:

> On Wed, Jun 14, 2017 at 12:30:02PM +0300, Dan Carpenter wrote:
>> I found this bug by reviewing places where we do ERR_PTR(0) (which is
>> NULL).
>>=20
>> We used to return an error pointer if lookup_one_len() failed but we
>> moved this code into a helper function and accidentally removed that.
>> NULL is a valid return for this function but it's not what we intended.
>>=20
>> Fixes: bbf7a8a3562f ("exportfs: move most of reconnect_path to helper fu=
nction")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> ACK.  Agreed that the current code is wrong, and that this is the
> correct fix.
>
> What I don't quite understand yet is what the impact of the bug would
> be.
>

It is interesting that reconnect_path() handles the possibility of
reconnect_one() returning NULL, even though it will only do that if this
"bug" is triggered.
When that happens, the target_dir (a descendent of dentry) gets its
DCACHE_DISCONNECTED flag cleared.

The bug can presumably only be triggered by a race.
We look through a directory to find the name for an  inode
(exportfs_get_name), then try to look up that name and it doesn't exist.

So presumably if you lose the race, some dentry will get
DCACHE_DISCONNECTED cleared, even though it is still disconnected.
This breaks a contract and can cause weirdness in dcache operations.

If the lookup_one_len_unlocked() fails, we should probably retry, at
least once.  But if we do decide to give up, we shouldn't assume it all
worked.

So I suggest:
 - the fix as provided by Dan, plus
 - remove "if (!parent) break;" from reconnect_path(), plus
 - maybe retry the get_name/lookup_one operation once if the first
    attempt fails.

NeilBrown


> --b.
>
>>=20
>> diff --git a/fs/exportfs/expfs.c b/fs/exportfs/expfs.c
>> index 329a5d103846..451237745689 100644
>> --- a/fs/exportfs/expfs.c
>> +++ b/fs/exportfs/expfs.c
>> @@ -147,6 +147,7 @@ static struct dentry *reconnect_one(struct vfsmount =
*mnt,
>>  	tmp =3D lookup_one_len_unlocked(nbuf, parent, strlen(nbuf));
>>  	if (IS_ERR(tmp)) {
>>  		dprintk("%s: lookup failed: %d\n", __func__, PTR_ERR(tmp));
>> +		err =3D PTR_ERR(tmp);
>>  		goto out_err;
>>  	}
>>  	if (tmp !=3D dentry) {

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAllBsLMACgkQOeye3VZi
gbkwBA/9HyrL4X04TMJbCcs0Z2e5eV/uqWpC8kvLIWo+tABk+72fPZqAtQbV0Mbh
YRPs2dZ9o/CnrdyKS/eNlOQ+jcG+KmHGMGBYmCaXW27VQjPWQ3u/NdPLVxTfGsqk
OAOocfAMJCiNTLLhda2pOgYEFacdWcjO9z06px5FmteBrBQGiW1jrTf6N/JFYidU
cn23rBQv+yWp3feqHGyIbm6uobYD5lHcpoEB6MLvfecGX+gyDCtSWGmf9JlNbMJe
l2TIyjC2nfuML2nKtCrUKOUl73/yasetDPEjvPxHfKjShjbuEVL/kP2sTqAKz3mB
19/P2H3QLMc0Vo0bj9uzcpY4/G1wCnfHY1hjsQJ81ak2NEssERbI9WaAmeR5HXWV
C3nT6NwSL4cbFHBdca382S+esUvBzPdz7TADusphnhLsyrCJ8SMlREKU8vmBC3W+
USeqptUqf/rLMbxUnm6pSubTWNPmLZpumSn01gtQLwN2BxaNgXPBYhjCxZwiLwEk
0K7CsJ1PxFWkMWqgPQZnzVrvsWYR6ycA32TRRMG6nO8PVtYcv2/NoP8UDiHP+S8N
WgODvSncd/dNZjOlftW5RC6CDEXmQD5Fv9rHC6L2fJfp3mks5PiO9SzCBnabHhij
R2w5tLdy8ehckcJcB4auTKDvIXc2Wh9ybgqDmx+X/F7Xi/71cyo=
=Okr1
-----END PGP SIGNATURE-----
--=-=-=--
