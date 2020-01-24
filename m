From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Date: Fri, 24 Jan 2020 12:52:18 +0000
Subject: Re: [PATCH] um: Fix some error handling in uml_vector_user_bpf()
Message-Id: <36070c96-8e75-7d06-d945-87a9d366d0b9@cambridgegreys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200124101450.jxfzsh6sz7v324hv@kili.mountain>
In-Reply-To: <20200124101450.jxfzsh6sz7v324hv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jeff Dike <jdike@addtoit.com>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>, Alex Dewar <alex.dewar@gmx.co.uk>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>



On 24/01/2020 10:14, Dan Carpenter wrote:
> 1) The uml_vector_user_bpf() returns pointers so it should return NULL
>     instead of false.
> 2) If the "bpf_prog" allocation failed, it would have eventually lead to
>     a crash.  We can't succeed after the error happens so it should just
>     return.
> 
> Fixes: 9807019a62dc ("um: Loadable BPF "Firmware" for vector drivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   arch/um/drivers/vector_user.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/um/drivers/vector_user.c b/arch/um/drivers/vector_user.c
> index ddcd917be0af..88483f5b034c 100644
> --- a/arch/um/drivers/vector_user.c
> +++ b/arch/um/drivers/vector_user.c
> @@ -732,13 +732,13 @@ void *uml_vector_user_bpf(char *filename)
>   
>   	if (stat(filename, &statbuf) < 0) {
>   		printk(KERN_ERR "Error %d reading bpf file", -errno);
> -		return false;
> +		return NULL;

I will sort this one out, thanks for noticing.

>   	}
>   	bpf_prog = uml_kmalloc(sizeof(struct sock_fprog), UM_GFP_KERNEL);
> -	if (bpf_prog != NULL) {
> -		bpf_prog->len = statbuf.st_size / sizeof(struct sock_filter);
> -		bpf_prog->filter = NULL;
> -	}
> +	if (!pfg_prog)

^^^^^ ?

> +		return NULL;
> +	bpf_prog->len = statbuf.st_size / sizeof(struct sock_filter);
> +	bpf_prog->filter = NULL;
>   	ffd = os_open_file(filename, of_read(OPENFLAGS()), 0);
>   	if (ffd < 0) {
>   		printk(KERN_ERR "Error %d opening bpf file", -errno);
> 

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
