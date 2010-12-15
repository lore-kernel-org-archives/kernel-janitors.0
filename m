From: Andreas Dilger <adilger.kernel@dilger.ca>
Date: Wed, 15 Dec 2010 22:19:00 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <7F573072-2CA4-4EE9-84AA-4AC6C7013CCA@dilger.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack> <4CEBD37E.5060107@bfs.de> <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca> <4CECECA2.6070301@draigBrady.com> <20101124110535.GD5139@cr0.nay.redhat.com> <4CECFB19.1090003@draigBrady.com> <20101215094953.GG19804@ZenIV.linux.org.uk> <0BAF9CFC-72BF-49A1-93D3-BF60B892389B@dilger.ca> <Pine.LNX.4.64.1012152133010.29684@ask.diku.dk> <1292446368.2603.13.camel@edumazet-laptop>
In-Reply-To: <1292446368.2603.13.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, Al Viro <viro@ZenIV.linux.org.uk>, P??draig Brady <P@draigBrady.com>, Am??rico Wang <xiyou.wangcong@gmail.com>, wharms@bfs.de, Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On 2010-12-15, at 13:52, Eric Dumazet wrote:
> Le mercredi 15 d=E9cembre 2010 =E0 21:33 +0100, Julia Lawall a =E9crit :
>> On Wed, 15 Dec 2010, Andreas Dilger wrote:
>>> I thought my proposed solution was reasonable - add explicit padding fi=
elds where there are holes in the structure, which would be unused by the k=
ernel, but since they are defined fields the compiler is obligated to initi=
alize them.
>>=20
>> Is the presence of holes always apparent at the source code level?
>> Or is it dependent on the compiler or target architecture?
>=20
> It depends on target architecture.
>=20
> This means doing a full review to add a named padding only for arches
> that need it.

There are automated tools like "pahole" (IIRC) that will report the presenc=
e of these structure holes.  However, the memset(0) won't add itself to the=
 code either (i.e. it needs an audit to determine if it is needed).

Cheers, Andreas





--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
