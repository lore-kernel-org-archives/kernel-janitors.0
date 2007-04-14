From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sat, 14 Apr 2007 10:28:07 +0000
Subject: Re: [KJ] [PATCH 03/04]use set_current_state in fs
Message-Id: <20070414101607.GA16817@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070414084956.GD14084@arun.site> <4620A13F.6060502@cosmosbay.com>
In-Reply-To: <4620A13F.6060502@cosmosbay.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Eric Dumazet <dada1@cosmosbay.com>
Cc: kernel-janitors@lists.osdl.org, nfs@lists.sourceforge.net, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, trond.myklebust@fys.uio.no

On 11:39 Sat 14 Apr     , Eric Dumazet wrote:
> Milind Arun Choudhary a =E9crit :
> >use set_current_state(TASK_*) instead of current->state =3D TASK_*, in f=
s/nfs
> Probably a dumb question, so please forgive me.
no.
you have a valid point

My bad :(
I should probably be enjoying my weekend outdoors..
breath some fresh air...
rather than sending such dumb patches..

ummmmmmmm
booting into  windows might help :)

> Why are you  forcing a memory barrier here, (and also on your other=20
> patches).
> Is'nt a  __set_current_state(TASK_RUNNING); appropriate ?
it is..

would resend later

Njo!!!
--=20
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
