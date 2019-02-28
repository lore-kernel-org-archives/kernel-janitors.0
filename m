From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2019 13:36:05 +0000
Subject: Re: [PATCH] tools/libbpf: signedness bug in btf_dedup_ref_type()
Message-Id: <20190228133605.GC9806@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190228054627.GC3253@kadam>
 <a34432d0-b838-c004-ef79-052cd50996c0@fb.com>
In-Reply-To: <a34432d0-b838-c004-ef79-052cd50996c0@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yonghong Song <yhs@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Feb 28, 2019 at 06:58:29AM +0000, Yonghong Song wrote:
> 
> 
> On 2/27/19 9:46 PM, Dan Carpenter wrote:
> > The "ref_type_id" variable needs to be signed for the error handling
> > to work.
> > 
> > Fixes: d5caef5b5655 ("btf: add BTF types deduplication algorithm")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > This goes through the BPF tree probably, although it does apply to
> > net-next.
> > 
> >   tools/lib/bpf/btf.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
> > index 68b50e9bbde1..8faed5386124 100644
> > --- a/tools/lib/bpf/btf.c
> > +++ b/tools/lib/bpf/btf.c
> > @@ -2326,7 +2326,8 @@ static int btf_dedup_ref_type(struct btf_dedup *d, __u32 type_id)
> >   	struct btf_type *t, *cand;
> >   	/* if we don't find equivalent type, then we are representative type */
> >   	__u32 new_id = type_id;
> > -	__u32 h, ref_type_id;
> > +	__u32 h; > +	int ref_type_id;
> 
> nit. Maybe you can change to
> 	int ref_type_id;
> 	__u32 h;
> to maintain kernel declaration reverse christmas tree convention?
> 

Yes.  Thanks.  Let me resend.

regards,
dan carpenter
