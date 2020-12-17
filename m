From: Samuel Cabrero <scabrero@suse.de>
Date: Thu, 17 Dec 2020 11:40:18 +0000
Subject: Re: [PATCH 1/3] cifs: Delete a stray unlock in cifs_swn_reconnect()
Message-Id: <f7dfcf49dbfebeaf49e2f36d8c72e34c74a32fb5.camel@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9s6nGDLt4xreaYN@mwanda>
In-Reply-To: <X9s6nGDLt4xreaYN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Steve French <sfrench@samba.org>
Cc: Aurelien Aptel <aaptel@suse.com>, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2020-12-17 at 14:01 +0300, Dan Carpenter wrote:
> The unlock is done in the caller, this is a stray which leads to a
> double unlock bug.
> 

Indeed.

Reviewed-by: Samuel Cabrero <scabrero@suse.de>

-- 
Samuel Cabrero / SUSE Labs Samba Team
GPG: D7D6 E259 F91C F0B3 2E61 1239 3655 6EC9 7051 0856
scabrero@suse.com
scabrero@suse.de
