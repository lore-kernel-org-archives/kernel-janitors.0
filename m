From: Steve French <smfrench@gmail.com>
Date: Tue, 05 Nov 2019 22:26:55 +0000
Subject: Re: [PATCH 0/2] CIFS: Adjustments for smb2_ioctl_query_info()
Message-Id: <CAH2r5mvWXtSdKb3RcSR_Z6LwsGhDmR0wBeKekwkS-VG4YnFNpQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
In-Reply-To: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Aurelien Aptel <aaptel@suse.com>

merged into cifs-2.6.git for-next

On Tue, Nov 5, 2019 at 3:38 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 5 Nov 2019 22:32:23 +0100
>
> Two update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>   Use memdup_user() rather than duplicating its implementation
>   Use common error handling code in smb2_ioctl_query_info()
>
>  fs/cifs/smb2ops.c | 58 ++++++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 31 deletions(-)
>
> --
> 2.24.0
>


-- 
Thanks,

Steve
