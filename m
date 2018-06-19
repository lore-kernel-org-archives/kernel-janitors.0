From: Paulo Alcantara <paulo@paulo.ac>
Date: Tue, 19 Jun 2018 13:12:19 +0000
Subject: Re: [PATCH] cifs: Silence uninitialized variable warning
Message-Id: <87602ec43w.fsf@paulo.ac>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180619122530.a7b5ic6jdsl65ez5@kili.mountain>
In-Reply-To: <20180619122530.a7b5ic6jdsl65ez5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This is not really a runtime issue but Smatch complains that:
>
>     fs/cifs/smb2ops.c:1740 smb2_query_symlink()
>     error: uninitialized symbol 'resp_buftype'.
>
> The warning is right that it can be uninitialized...  Also "err_buf"
> would be NULL at this point and we're not supposed to pass NULLs to
> free_rsp_buf() or it might trigger some extra output if we turn on
> debugging.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Paulo Alcantara <palcantara@suse.de>

Thanks
Paulo
