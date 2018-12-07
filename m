From: Steve French <smfrench@gmail.com>
Date: Fri, 07 Dec 2018 07:27:42 +0000
Subject: Re: [PATCH -next] cifs: remove set but not used variable 'smb_buf'
Message-Id: <CAH2r5muSVoQcvkAghxqZFz+zcdw=8Pm_gY5-SPY--k+PegOFJQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536198643-6123-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

merged into cifs-2.6.git for-next
On Fri, Dec 7, 2018 at 12:57 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> fs/cifs/sess.c: In function '_sess_auth_rawntlmssp_assemble_req':
> fs/cifs/sess.c:1157:18: warning:
>  variable 'smb_buf' set but not used [-Wunused-but-set-variable]
>
> It never used since commit cc87c47d9d7a ("cifs: Separate rawntlmssp auth
> from CIFS_SessSetup()")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/sess.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index 7fa447a..dcd49ad 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -1154,14 +1154,12 @@ struct sess_data {
>  static int
>  _sess_auth_rawntlmssp_assemble_req(struct sess_data *sess_data)
>  {
> -       struct smb_hdr *smb_buf;
>         SESSION_SETUP_ANDX *pSMB;
>         struct cifs_ses *ses = sess_data->ses;
>         __u32 capabilities;
>         char *bcc_ptr;
>
>         pSMB = (SESSION_SETUP_ANDX *)sess_data->iov[0].iov_base;
> -       smb_buf = (struct smb_hdr *)pSMB;
>
>         capabilities = cifs_ssetup_hdr(ses, pSMB);
>         if ((pSMB->req.hdr.Flags2 & SMBFLG2_UNICODE) = 0) {
>
>
>


-- 
Thanks,

Steve
