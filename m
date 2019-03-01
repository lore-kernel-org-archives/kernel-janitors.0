From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 01 Mar 2019 00:01:05 +0000
Subject: Re: [PATCH v3] tools/libbpf: signedness bug in btf_dedup_ref_type()
Message-Id: <847adb2b-bf4f-1335-b1b6-a960b6c947d5@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190228180647.GF9806@kadam>
In-Reply-To: <20190228180647.GF9806@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>
Cc: Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/28/2019 07:06 PM, Dan Carpenter wrote:
> The "ref_type_id" variable needs to be signed for the error handling
> to work.
> 
> Fixes: d5caef5b5655 ("btf: add BTF types deduplication algorithm")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Andrii Nakryiko <andriin@fb.com>

Applied, thanks!
