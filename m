From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 26 May 2014 22:42:02 +0000
Subject: Re: [PATCH 16/18] HID: uhid: Use kmemdup instead of kmalloc + memcpy
Message-Id: <alpine.LNX.2.00.1405270041480.28869@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr> <1401117687-28911-17-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-17-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benoit Taine <benoit.taine@lip6.fr>
Cc: David Herrmann <dh.herrmann@googlemail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 26 May 2014, Benoit Taine wrote:

> This issue was reported by coccicheck using the semantic patch 
> at scripts/coccinelle/api/memdup.cocci
> 
> Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>

Applied, thanks Benoit.

-- 
Jiri Kosina
SUSE Labs
