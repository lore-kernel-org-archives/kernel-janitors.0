From: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Date: Mon, 14 Dec 2020 12:16:26 +0000
Subject: Re: [PATCH] cifs: Fix uninitialized variable in set_chmod_dacl()
Message-Id: <871rfsd1lx.fsf@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9dS1EllbQhuX7/C@mwanda>
In-Reply-To: <X9dS1EllbQhuX7/C@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Steve French <sfrench@samba.org>, Shyam Prasad N <sprasad@microsoft.com>
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org

Hi Dan,

Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
writes:
> Initialize the "nmode" variable earlier to prevent an uninitialized
> variable bug when we do "size += setup_special_mode_ACE(pntace, nmode);"
>
> Fixes: 253374f7557e ("cifs: Fix unix perm bits to cifsacl conversion for "other" bits.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The current version of Steve's for-next already sets nmode earlier in
commit 0f22053e811ca ("cifs: Fix unix perm bits to cifsacl conversion
for "other" bits."). I believe this patch can be ignored.

Cheers,
-- 
Aurélien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg, DE
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah HRB 247165 (AG München)
