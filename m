From: Jason Wang <jasowang@redhat.com>
Date: Tue, 18 Apr 2017 03:01:49 +0000
Subject: Re: [PATCH] ringtest: fix an assert statement
Message-Id: <e6715605-242b-bf8f-855b-ba443054c87d@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170415192214.GB6416@mwanda>
In-Reply-To: <20170415192214.GB6416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org



On 2017年04月16日 03:22, Dan Carpenter wrote:
> There is an || vs && typo so the assert can never be triggered.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/tools/virtio/ringtest/main.c b/tools/virtio/ringtest/main.c
> index 022ae95a06bd..453ca3c21193 100644
> --- a/tools/virtio/ringtest/main.c
> +++ b/tools/virtio/ringtest/main.c
> @@ -87,7 +87,7 @@ void set_affinity(const char *arg)
>   	cpu = strtol(arg, &endptr, 0);
>   	assert(!*endptr);
>   
> -	assert(cpu >= 0 || cpu < CPU_SETSIZE);
> +	assert(cpu >= 0 && cpu < CPU_SETSIZE);
>   
>   	self = pthread_self();
>   	CPU_ZERO(&cpuset);

Acked-by: Jason Wang <jasowang@redhat.com>
