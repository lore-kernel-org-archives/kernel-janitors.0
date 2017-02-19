From: walter harms <wharms@bfs.de>
Date: Sun, 19 Feb 2017 13:19:40 +0000
Subject: Re: [PATCH] tools/vm: Fix possible resource leak in page_owner_sort.c
Message-Id: <58A99B6C.8000606@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219054949.GA2754@localhost.localdomain>
In-Reply-To: <20170219054949.GA2754@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saurabh Badhwar <sbsaurabhbadhwar9@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 19.02.2017 06:49, schrieb Saurabh Badhwar:
> Fix possible resource leak in tools/vm/page_owner_sort.c
> Signed-off-by: Saurabh Badhwar <sbsaurabhbadhwar9@gmail.com>
> ---
>  tools/vm/page_owner_sort.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/vm/page_owner_sort.c b/tools/vm/page_owner_sort.c
> index f1c055f..8346261 100644
> --- a/tools/vm/page_owner_sort.c
> +++ b/tools/vm/page_owner_sort.c
> @@ -110,6 +110,8 @@ int main(int argc, char **argv)
>  	buf = malloc(BUF_SIZE);
>  	if (!list || !buf) {
>  		printf("Out of memory\n");
> +		fclose(fin);
> +		fclose(fout);
>  		exit(1);
>  	}

the is no resource leak as file pointer get closed on exit
ntl it is ok the close them
but error messages should go to stderr an be more verbose.

just my 2 cents,
 wh
>  
> @@ -144,6 +146,7 @@ int main(int argc, char **argv)
>  
>  	for (i = 0; i < count; i++)
>  		fprintf(fout, "%d times:\n%s\n", list2[i].num, list2[i].txt);
> -
> +		
> +	fclose(fout);
>  	return 0;
>  }
