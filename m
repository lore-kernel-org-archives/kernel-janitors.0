From: Samuel Cabrero <scabrero@suse.de>
Date: Thu, 17 Dec 2020 11:42:08 +0000
Subject: Re: [PATCH 2/2] cifs: Unlock on errors in cifs_swn_reconnect()
Message-Id: <c49a149e01ada5b6e842190de6da4b70e9d7f0a3.camel@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9s6xZZISL/SRoZm@mwanda>
In-Reply-To: <X9s6xZZISL/SRoZm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Steve French <sfrench@samba.org>
Cc: Aurelien Aptel <aaptel@suse.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

On Thu, 2020-12-17 at 14:02 +0300, Dan Carpenter wrote:
> There are three error paths which need to unlock before returning.

Thanks.

Reviewed-by: Samuel Cabrero <scabrero@suse.de>

-- 
Samuel Cabrero / SUSE Labs Samba Team
GPG: D7D6 E259 F91C F0B3 2E61 1239 3655 6EC9 7051 0856
scabrero@suse.com
scabrero@suse.de
