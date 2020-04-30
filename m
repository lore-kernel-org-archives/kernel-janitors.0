From: Daniel Borkmann <daniel@iogearbox.net>
Date: Thu, 30 Apr 2020 14:26:23 +0000
Subject: Re: [PATCH -next] bpf: fix error return code in map_lookup_and_delete_elem()
Message-Id: <5813e11c-9aba-8273-e935-1ddb5a3f9b47@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200430081851.166996-1-weiyongjun1@huawei.com>
In-Reply-To: <20200430081851.166996-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Mauricio Vasquez B <mauricio.vasquez@polito.it>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/30/20 10:18 AM, Wei Yongjun wrote:
> Fix to return negative error code -EFAULT from the copy_to_user() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: bd513cd08f10 ("bpf: add MAP_LOOKUP_AND_DELETE_ELEM syscall")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   kernel/bpf/syscall.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 3cea7602de78..68c22e9420fa 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1492,8 +1492,10 @@ static int map_lookup_and_delete_elem(union bpf_attr *attr)
>   	if (err)
>   		goto free_value;
>   
> -	if (copy_to_user(uvalue, value, value_size) != 0)
> +	if (copy_to_user(uvalue, value, value_size) != 0) {
> +		err = -EFAULT;
>   		goto free_value;
> +	}
>   

Good catch! Applied to bpf, thanks!
