From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 13 Jun 2019 16:58:53 +0000
Subject: Re: [PATCH] selftests/bpf: signedness bug in enable_all_controllers()
Message-Id: <CAEf4BzZn4hHobOBiQmSPQhKTrsi7MC=R-7OjWTMyFC03ehrjgg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613070021.GG16334@mwanda>
In-Reply-To: <20190613070021.GG16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shuah Khan <shuah@kernel.org>, Roman Gushchin <guro@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, linux-kselftest@vger.kernel.org, bpf <bpf@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jun 13, 2019 at 9:40 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "len" variable needs to be signed for the error handling to work
> properly.
>
> Fixes: 596092ef8bea ("selftests/bpf: enable all available cgroup v2 controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for the fix!

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  tools/testing/selftests/bpf/cgroup_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/cgroup_helpers.c b/tools/testing/selftests/bpf/cgroup_helpers.c
> index 0d89f0396be4..e95c33e333a4 100644
> --- a/tools/testing/selftests/bpf/cgroup_helpers.c
> +++ b/tools/testing/selftests/bpf/cgroup_helpers.c
> @@ -47,7 +47,7 @@ int enable_all_controllers(char *cgroup_path)
>         char buf[PATH_MAX];
>         char *c, *c2;
>         int fd, cfd;
> -       size_t len;
> +       ssize_t len;
>
>         snprintf(path, sizeof(path), "%s/cgroup.controllers", cgroup_path);
>         fd = open(path, O_RDONLY);
> --
> 2.20.1
>
