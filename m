From: =?ISO-8859-1?Q?P=E1draig_Brady?= <P@draigBrady.com>
Date: Wed, 24 Nov 2010 10:44:50 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <4CECECA2.6070301@draigBrady.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com> <20101112120834.33062900.akpm@linux-foundation.org> <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack> <4CEBD37E.5060107@bfs.de> <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca>
In-Reply-To: <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andreas Dilger <adilger.kernel@dilger.ca>
Cc: wharms@bfs.de, =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On 23/11/10 18:02, Andreas Dilger wrote:
> On 2010-11-23, at 07:45, walter harms wrote:
>> Maybe we can convince the gcc people to make 0 padding default. That wil=
l not solve the problems for other compilers but when they claim "works lik=
e gcc" we can press then to support this also. I can imagine that this will=
 close some other subtle leaks also.
>=20
> It makes the most sense to tackle this at the GCC level, since the added =
overhead of doing memset(0) on the whole struct may be non-trivial for comm=
only-used and/or large structures.  Since GCC is already explicitly zeroing=
 the _used_ fields in the struct, it can much more easily determine whether=
 there is padding in the structure, and zero those few bytes as needed.

Zero padding structs is part of C90. Details here:
http://www.pixelbeat.org/programming/gcc/auto_init.html

gcc doesn't zero pad when _all_ elements are specified.

So perhaps just:

-        struct timespec rts;
-        struct timeval rtv;
+        struct timespec rts =3D {0,};
+        struct timeval rtv =3D {0,};

One could also move the rtv declaration
to the scope where it's used.

cheers,
P=E1draig.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
