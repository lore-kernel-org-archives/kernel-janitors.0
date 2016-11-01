From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 01 Nov 2016 19:17:52 +0000
Subject: Re: [PATCH] UBIFS: Remove some dead code
Message-Id: <1dc01a45-1eb4-20bd-c5c8-c8f37ba60e06@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161101064525.11813-1-christophe.jaillet@wanadoo.fr>
 <a074d673-cf23-d7a1-7b1e-0e1f8f7b0ffe@nod.at>
In-Reply-To: <a074d673-cf23-d7a1-7b1e-0e1f8f7b0ffe@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com, adrian.hunter@intel.com, julia.lawall@lip6.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 01/11/2016 =E0 12:42, Richard Weinberger a =E9crit :
> On 01.11.2016 07:45, Christophe JAILLET wrote:
>> 'ubifs_fast_find_freeable()' can not return an error pointer, so this te=
st
>> can be removed.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   fs/ubifs/gc.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
>> index e845c64b6ce1..7b35e3d6cde7 100644
>> --- a/fs/ubifs/gc.c
>> +++ b/fs/ubifs/gc.c
>> @@ -846,10 +846,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
>>   	 */
>>   	while (1) {
>>   		lp =3D ubifs_fast_find_freeable(c);
>> -		if (IS_ERR(lp)) {
>> -			err =3D PTR_ERR(lp);
>> -			goto out;
>> -		}
> Good catch, how did you find this?
> If you have a tool/script I'd like to use it too.
>
> Thanks,
> //richard
> --

Hi,
well, it is a bit tricky.

AFAIK, coccinelle is only able to match things in a given file. Finding=20
issues between 2 files can be tricky.

So first, I have built a list a functions which are likely to return=20
NULL, either because they explicitly return NULL or if its return value=20
is tested against NULL or not. See coccinelle script n=B01 below.
Then I have built a list of functions followed by a test with IS_ERR.=20
See coccinelle script n=B02 below.

These 2 scripts generate 2 lists of functions.
If a function is present in the 2 files, it is likely that something is=20
spurious.

Either the IS_ERR is not needed (this is the case in the patch above),=20
either the return value is incorrectly checked. Could also be that NULL=20
is returned but an error pointer would be a better option.


I also did more or less the same for functions that return PTR_ERR and=20
functions that are not followed by a test with IS_ERR.
I can post these other scripts if wanted.



Any ideas to improve or speed-up the coccinelle scripts are welcome.
Julia ?


Best regards,
CJ



Coccinelle script n=B01:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D@find@
identifier f;
@@

    f(...)
    {
       ...
       return NULL;
    }

@script:python@
f << find.f;
@@

print "%s" %(f)



@find2@
identifier f;
expression x;
statement S;
@@

    x =3D f(...);
(
    if (x) S
|
    if (!x) S
)

@script:python@
f << find2.f;
@@

print "%s" %(f)





Coccinelle script n=B02:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D@find@
statement S;
type t;
t *x;
identifier f;
@@

     x =3D f(...);
(
     if (IS_ERR(x)) S
|
     if (!IS_ERR(x)) S
)



@script:python@
f << find.f;
@@

print "%s" %(f)



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
