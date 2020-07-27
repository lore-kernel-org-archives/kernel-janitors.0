From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Mon, 27 Jul 2020 01:49:20 +0000
Subject: Re: [PATCH] docs: filesystems: vfs: correct flag name
Message-Id: <20200727014920.GN7625@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595789020-12941-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595789020-12941-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Jonathan Corbet <corbet@lwn.net>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 26, 2020 at 08:43:40PM +0200, Julia Lawall wrote:
> There is no flag REMAP_CAN_SHORTEN.  Commit eca3654e3cc7 ("vfs: enable
> remap callers that can handle short operations") that introduces this
> text also introduces the flag REMAP_FILE_CAN_SHORTEN.  Change the name
> in the documentation accordingly.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

D'oh.  Good catch!
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> 
> ---
>  Documentation/filesystems/vfs.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index da4b735..d08357d 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -1116,7 +1116,7 @@ otherwise noted.
>  	before any bytes were remapped.  The remap_flags parameter
>  	accepts REMAP_FILE_* flags.  If REMAP_FILE_DEDUP is set then the
>  	implementation must only remap if the requested file ranges have
> -	identical contents.  If REMAP_CAN_SHORTEN is set, the caller is
> +	identical contents.  If REMAP_FILE_CAN_SHORTEN is set, the caller is
>  	ok with the implementation shortening the request length to
>  	satisfy alignment or EOF requirements (or any other reason).
>  
> 
