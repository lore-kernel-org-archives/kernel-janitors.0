From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2018 14:39:30 +0000
Subject: Re: [PATCH 1/2] bpf: sockmap, double free in __sock_map_ctx_update_elem()
Message-Id: <20180518143930.hopqsx3sbrbsxlfp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518075810.GA28285@mwanda>
 <e9dc40fb-ffa6-58af-d9df-eaab2d0a9259@iogearbox.net>
In-Reply-To: <e9dc40fb-ffa6-58af-d9df-eaab2d0a9259@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Daniel Borkmann <daniel@iogearbox.net>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Alexei Starovoitov <ast@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 18, 2018 at 10:27:18AM +0200, Daniel Borkmann wrote:
>=20
> Thanks for the two fixes, appreciate it! There were two similar ones that
> fix the same issues which were already applied yesterday to bpf-next:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?=
id=0E4364560361d57e8cd873a8990327f3471d7d8a
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?=
id=A78622932c27e8ec33e5ba180f3d2e87fb806b28

Hey Gustavo,

We're sort of duplicating each other's work.  Could you CC
kernel-janitors@vger.kernel.org for static checker fixes so that I can
see what you're working on?

We'll probably still send the occasional duplicate which is fine...

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
