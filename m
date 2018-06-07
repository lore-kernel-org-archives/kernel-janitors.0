From: Roman Gushchin <guro@fb.com>
Date: Thu, 07 Jun 2018 12:52:27 +0000
Subject: Re: [PATCH] kselftest/cgroup: fix a signedness bug
Message-Id: <20180607125224.GA4302@castle>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180607083001.m4z4wjev6j3sc423@kili.mountain>
In-Reply-To: <20180607083001.m4z4wjev6j3sc423@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2018 at 11:30:02AM +0300, Dan Carpenter wrote:
> "len" needs to be signed for the error handling to work.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
> index b69bdeb4b9fe..1e9e3c470561 100644
> --- a/tools/testing/selftests/cgroup/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
> @@ -35,7 +35,7 @@ static ssize_t read_text(const char *path, char *buf, size_t max_len)
>  	return len;
>  }
>  
> -static ssize_t write_text(const char *path, char *buf, size_t len)
> +static ssize_t write_text(const char *path, char *buf, ssize_t len)
>  {
>  	int fd;
>  
> @@ -140,7 +140,7 @@ long cg_read_key_long(const char *cgroup, const char *control, const char *key)
>  int cg_write(const char *cgroup, const char *control, char *buf)
>  {
>  	char path[PATH_MAX];
> -	size_t len = strlen(buf);
> +	ssize_t len = strlen(buf);
>  
>  	snprintf(path, sizeof(path), "%s/%s", cgroup, control);
>  

Looks good to me!

Thanks!
