From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 27 Jul 2020 22:15:49 +0000
Subject: Re: [PATCH] docs: filesystems: vfs: correct sync_mode flag names
Message-Id: <20200727161549.1d3e31a0@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595791341-13209-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595791341-13209-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 26 Jul 2020 21:22:21 +0200
Julia Lawall <Julia.Lawall@inria.fr> wrote:

> Change the nonexistent flag names WBC_SYNC_ALL and WBC_SYNC_NONE to
> WB_SYNC_ALL and WB_SYNC_NONE, respectively, as used in the code with
> wbc->sync_mode.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  Documentation/filesystems/vfs.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index da4b735..57e9b51 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -766,9 +766,9 @@ cache in your filesystem.  The following members are defined:
>  
>  ``writepages``
>  	called by the VM to write out pages associated with the
> -	address_space object.  If wbc->sync_mode is WBC_SYNC_ALL, then
> +	address_space object.  If wbc->sync_mode is WB_SYNC_ALL, then
>  	the writeback_control will specify a range of pages that must be
> -	written out.  If it is WBC_SYNC_NONE, then a nr_to_write is
> +	written out.  If it is WB_SYNC_NONE, then a nr_to_write is
>  	given and that many pages should be written if possible.  If no
>  	->writepages is given, then mpage_writepages is used instead.  
>  	This will choose pages from the address space that are tagged as

Applied, thanks.

jon
