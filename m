From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Sat, 19 May 2018 00:17:57 +0000
Subject: Re: [PATCH 1/2] bpf: sockmap, double free in __sock_map_ctx_update_elem()
Message-Id: <b5667bc9-0c43-c8aa-1963-92f3e8884b7a@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518075810.GA28285@mwanda>
 <e9dc40fb-ffa6-58af-d9df-eaab2d0a9259@iogearbox.net>
 <20180518143930.hopqsx3sbrbsxlfp@mwanda>
In-Reply-To: <20180518143930.hopqsx3sbrbsxlfp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


Hi Dan,

On 05/18/2018 09:39 AM, Dan Carpenter wrote:
> On Fri, May 18, 2018 at 10:27:18AM +0200, Daniel Borkmann wrote:
>>
>> Thanks for the two fixes, appreciate it! There were two similar ones that
>> fix the same issues which were already applied yesterday to bpf-next:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/=
?id=0E4364560361d57e8cd873a8990327f3471d7d8a
>> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/=
?id=A78622932c27e8ec33e5ba180f3d2e87fb806b28
>=20
> Hey Gustavo,
>=20
> We're sort of duplicating each other's work.  Could you CC
> kernel-janitors@vger.kernel.org for static checker fixes so that I can
> see what you're working on?
>=20

Sure thing.

I've been doing this work for more than a year now and just recently we=20
are having these issues. I'm a bit curious about it.

> We'll probably still send the occasional duplicate which is fine...
>=20

Yep. Not a big deal for me.

Have a good one.
--
Gustavo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
