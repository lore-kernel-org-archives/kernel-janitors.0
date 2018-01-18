From: Steve French <smfrench@gmail.com>
Date: Thu, 18 Jan 2018 16:17:53 +0000
Subject: Re: [PATCH] cifs: remove redundant duplicated assignment of pointer 'node'
Message-Id: <CAH2r5mvkycvyx2OBDfTh89tO12Y4RYfw5ZVEJHg8YxVpjtJbQw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180117095239.10670-1-colin.king@canonical.com> <2031352942.702941.1516230683335.JavaMail.zimbra@redhat.com>
In-Reply-To: <2031352942.702941.1516230683335.JavaMail.zimbra-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ronnie Sahlberg <lsahlber-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, CIFS <linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, samba-technical <samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org>, kernel-janitors <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

merged into cifs-2.6.git for-next

thx

On Wed, Jan 17, 2018 at 5:11 PM, Ronnie Sahlberg <lsahlber@redhat.com> wrote:
> Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>
>
>
> ----- Original Message -----
> From: "Colin King" <colin.king@canonical.com>
> To: "Steve French" <sfrench@samba.org>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
> Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
> Sent: Wednesday, 17 January, 2018 8:52:39 PM
> Subject: [PATCH] cifs: remove redundant duplicated assignment of pointer 'node'
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Node is assigned twice to rb_first(root), first during declaration
> time and second after a taking a spin lock, so we have a duplicated
> assignment.  Remove the first assignment because it is redundant and
> also not protected by the spin lock.
>
> Cleans up clang warning:
> fs/cifs/connect.c:4435:18: warning: Value stored to 'node' during
> its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/connect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 0efd22e75ac7..63c5d85fe25e 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -4432,7 +4432,7 @@ cifs_prune_tlinks(struct work_struct *work)
>         struct cifs_sb_info *cifs_sb = container_of(work, struct cifs_sb_info,
>                                                     prune_tlinks.work);
>         struct rb_root *root = &cifs_sb->tlink_tree;
> -       struct rb_node *node = rb_first(root);
> +       struct rb_node *node;
>         struct rb_node *tmp;
>         struct tcon_link *tlink;
>
> --
> 2.15.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks,

Steve
