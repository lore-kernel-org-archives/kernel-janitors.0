From: Steve French <smfrench@gmail.com>
Date: Mon, 02 Dec 2019 22:57:15 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to pointer pneg_ctxt
Message-Id: <CAH2r5ms+DVGP+Wgx+cTe65sBCFskrXBNxNe1gMDr+sEQ1DbqAA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191202185942.81854-1-colin.king@canonical.com>
In-Reply-To: <20191202185942.81854-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

merged into cifs-2.6.git for-next

On Mon, Dec 2, 2019 at 1:00 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer pneg_ctxt is being initialized with a value that is never
> read and it is being updated later with a new value.  The assignment
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2pdu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index ed77f94dbf1d..be0de8a63e57 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -554,7 +554,7 @@ static void
>  assemble_neg_contexts(struct smb2_negotiate_req *req,
>                       struct TCP_Server_Info *server, unsigned int *total_len)
>  {
> -       char *pneg_ctxt = (char *)req;
> +       char *pneg_ctxt;
>         unsigned int ctxt_len;
>
>         if (*total_len > 200) {
> --
> 2.24.0
>


-- 
Thanks,

Steve
