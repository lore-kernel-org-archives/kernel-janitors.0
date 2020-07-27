From: Yonghong Song <yhs@fb.com>
Date: Mon, 27 Jul 2020 21:39:14 +0000
Subject: Re: [PATCH][next] bpf: fix swapped arguments in calls to check_buffer_access
Message-Id: <c9ea156a-20fa-5415-0d35-0521e8740ddc@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727175411.155179-1-colin.king@canonical.com>
In-Reply-To: <20200727175411.155179-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 7/27/20 10:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a couple of arguments of the boolean flag zero_size_allowed
> and the char pointer buf_info when calling to function check_buffer_access
> that are swapped by mistake. Fix these by swapping them to correct
> the argument ordering.
> 
> Addresses-Coverity: ("Array compared to 0")
> Fixes: afbf21dce668 ("bpf: Support readonly/readwrite buffers in verifier")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the fix!
Acked-by: Yonghong Song <yhs@fb.com>
