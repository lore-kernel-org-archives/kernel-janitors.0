From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2019 18:01:31 +0000
Subject: Re: [PATCH v2] tools/libbpf: signedness bug in btf_dedup_ref_type()
Message-Id: <20190228180131.GE9806@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a34432d0-b838-c004-ef79-052cd50996c0@fb.com>
 <20190228175035.GA30148@kadam>
 <20190228175300.GB9508@kernel.org>
In-Reply-To: <20190228175300.GB9508@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 28, 2019 at 02:53:00PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Thu, Feb 28, 2019 at 08:50:35PM +0300, Dan Carpenter escreveu:
> > The "ref_type_id" variable needs to be signed for the error handling
> > to work.
> 
> Does the infiniband signedness change comes as a bonus? :-)
> 

Oh wow...  :P

Let me resend v3.

regards,
dan carpenter
