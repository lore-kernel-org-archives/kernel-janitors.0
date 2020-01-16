From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Thu, 16 Jan 2020 10:02:39 +0000
Subject: Re: [PATCH][next] tools: bootconfig: fix spelling mistake "faile" -> "failed"
Message-Id: <20200116190239.9b318b2faa14465ece414f16@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116092206.52192-1-colin.king@canonical.com>
In-Reply-To: <20200116092206.52192-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Thu, 16 Jan 2020 09:22:06 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two spelling mistakes in printf statements, fix these.

Good catch!

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks!

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/bootconfig/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> index b8f174fd2a0a..91c9a5c0c499 100644
> --- a/tools/bootconfig/main.c
> +++ b/tools/bootconfig/main.c
> @@ -140,7 +140,7 @@ int load_xbc_from_initrd(int fd, char **buf)
>  		return 0;
>  
>  	if (lseek(fd, -8, SEEK_END) < 0) {
> -		printf("Faile to lseek: %d\n", -errno);
> +		printf("Failed to lseek: %d\n", -errno);
>  		return -errno;
>  	}
>  
> @@ -155,7 +155,7 @@ int load_xbc_from_initrd(int fd, char **buf)
>  		return 0;
>  
>  	if (lseek(fd, stat.st_size - 8 - size, SEEK_SET) < 0) {
> -		printf("Faile to lseek: %d\n", -errno);
> +		printf("Failed to lseek: %d\n", -errno);
>  		return -errno;
>  	}
>  
> -- 
> 2.24.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
