From: NeilBrown <neilb@suse.com>
Date: Thu, 15 Jun 2017 22:28:31 +0000
Subject: Re: [PATCH] reconnect_one(): fix a missing error code
Message-Id: <87injw7unk.fsf@notabene.neil.brown.name>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614093002.GG29394@elgon.mountain> <20170614203414.GC32208@fieldses.org> <87lgou6xqm.fsf@notabene.neil.brown.name> <20170615214002.GA6195@fieldses.org>
In-Reply-To: <20170615214002.GA6195@fieldses.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "J. Bruce Fields" <bfields@redhat.com>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15 2017, J. Bruce Fields wrote:

> On Thu, Jun 15, 2017 at 07:54:57AM +1000, NeilBrown wrote:
>> On Wed, Jun 14 2017, J. Bruce Fields wrote:
>>=20
>> > On Wed, Jun 14, 2017 at 12:30:02PM +0300, Dan Carpenter wrote:
>> >> I found this bug by reviewing places where we do ERR_PTR(0) (which is
>> >> NULL).
>> >>=20
>> >> We used to return an error pointer if lookup_one_len() failed but we
>> >> moved this code into a helper function and accidentally removed that.
>> >> NULL is a valid return for this function but it's not what we intende=
d.
>> >>=20
>> >> Fixes: bbf7a8a3562f ("exportfs: move most of reconnect_path to helper=
 function")
>> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> >
>> > ACK.  Agreed that the current code is wrong, and that this is the
>> > correct fix.
>> >
>> > What I don't quite understand yet is what the impact of the bug would
>> > be.
>> >
>>=20
>> It is interesting that reconnect_path() handles the possibility of
>> reconnect_one() returning NULL, even though it will only do that if this
>> "bug" is triggered.
>
> As Dan says, you're missing a case.

:-(

>
>> When that happens, the target_dir (a descendent of dentry) gets its
>> DCACHE_DISCONNECTED flag cleared.
>>=20
>> The bug can presumably only be triggered by a race.
>> We look through a directory to find the name for an  inode
>> (exportfs_get_name), then try to look up that name and it doesn't exist.
>
> Wouldn't lookup_one_len succesfully return a negative dentry in that
> case?

Uhm, yes.  That case has a nice big comment in the "tmp !=3D dentry" case
too.

>
> I think the error cases here are more likely due to permissions or IO
> errors.
>
> So, I wonder if you can get some kind of dcache corruption with an
> uncached lookup of a directory with an ancestor that we lack permission
> to.

It wouldn't be too hard to create that scenario.  It might be harder to
find a way to expose the corruption.

I think you should trigger the WARN_ON_ONCE() in clear_disconnected() if
you manage to trigger the bug.

The main reason that it is dangerous to have disconnected dentries
around is for the loop detection on directory renames.
You might be able to confuse the locking logic in there if one of
the directories isn't connected to the root.

Thanks,
NeilBrown


>
>> So presumably if you lose the race, some dentry will get
>> DCACHE_DISCONNECTED cleared, even though it is still disconnected.
>> This breaks a contract and can cause weirdness in dcache operations.
>>=20
>> If the lookup_one_len_unlocked() fails, we should probably retry, at
>> least once.  But if we do decide to give up, we shouldn't assume it all
>> worked.
>>=20
>> So I suggest:
>>  - the fix as provided by Dan, plus
>>  - remove "if (!parent) break;" from reconnect_path(), plus
>>  - maybe retry the get_name/lookup_one operation once if the first
>>     attempt fails.
>
> See the comments in the code--if we lose the race, then it's because of
> a concurrent operation which should have done the reconnection for us.
>
> --b.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAllDChEACgkQOeye3VZi
gbmpMxAAq++ykxHxu+LpEJopgI6oPjyaxsLauk2VgDKgUFS1cTiQKs2URa/Hr9VV
i4G0xyVW1T0hHGLLsiywcvYK14IKipp4SIJ7NJgzkztRKyZytCX+usxaB2X4Up4+
HzS2CX1d4e8D+7Z+j8fd1Nor7RQeLKzOo3D/5EFZ97mGx45rohGJ6nMX+EyjqoWN
ckRO+t67nzpQPPDWGh/Kg+R5Ni/sbEinhegS6Bsyfb5Xal/A4YJmx91ZtooHhTqp
YDOdPa+yvOXDnHCSMkNuGRnoir5JKcITagOk1AwR+7g69YcyPmMz4P+8ui27k+/d
t8NMYhkF30HofRtNNjDcCWLGzFeEEiEQXylYwGbwd1p6hm2VHjW5BruWdwwJGESn
dawWxlFLMpPup33SyLArsW2bynAkmd7NHRp0HR7bfJpMb49DVmFW7DP0F/jQ5epm
iZzr0FlwuRlV5E91ALgLjw+u+0GdaCgUR3tGIq/1LqFZ5pyeN9frbctBXLS9eqXW
XRbCSvjkCww0rW0wIBKPSFn07W1oJXH3eMLxJ+1alvS+SHiD4lpG5SDD46MYXqYQ
yeUf42Aeb1ZkRuxYgUdh0z6+z8au3ihz2mQgGcpAy6Y4iOoX8K3xk0MeK3Uk14Zl
PXBIaJzQucJK+fZ9O89CwsckknckZe04hKqmWoW3W6rIuWRhRKQ=
=sy9V
-----END PGP SIGNATURE-----
--=-=-=--
