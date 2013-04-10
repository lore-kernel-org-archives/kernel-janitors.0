From: Steve French <smfrench@gmail.com>
Date: Wed, 10 Apr 2013 20:56:11 +0000
Subject: Re: [patch] cifs: small variable name cleanup
Message-Id: <CAH2r5mt46HPyd_wRNTdFfr5H=o46qw7PBOPLiRxHepMML4xJfg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130410114300.GB21419@longonot.mountain>
In-Reply-To: <20130410114300.GB21419-dZEljifmRObu9KfB+GxooP8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, samba-technical <samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

merged into cifs-2.6.git for-3.10 branch

On Wed, Apr 10, 2013 at 6:43 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> server and ses->server are the same, but it's a little bit ugly that we
> lock &ses->server->srv_mutex and unlock &server->srv_mutex.  It causes
> a false positive in Smatch about inconsistent locking.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index edb2220..e3a0f81 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -3826,7 +3826,7 @@ cifs_setup_session(const unsigned int xid, struct cifs_ses *ses,
>         if (rc) {
>                 cifs_dbg(VFS, "Send error in SessSetup = %d\n", rc);
>         } else {
> -               mutex_lock(&ses->server->srv_mutex);
> +               mutex_lock(&server->srv_mutex);
>                 if (!server->session_estab) {
>                         server->session_key.response = ses->auth_key.response;
>                         server->session_key.len = ses->auth_key.len;



-- 
Thanks,

Steve
