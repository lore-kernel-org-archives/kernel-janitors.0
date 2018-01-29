From: David Miller <davem@davemloft.net>
Date: Mon, 29 Jan 2018 19:39:42 +0000
Subject: Re: [PATCH] ide: remove duplicated assignment to 'cursg'
Message-Id: <20180129.143942.1100860144218349617.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116175422.19722-1-colin.king@canonical.com>
In-Reply-To: <20180116175422.19722-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 17:54:22 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer cursg is initialized to cmd->cursg and again re-assigned the
> same value a few lines later, hence the second assignment is redundant
> and can be removed.
> 
> Cleans up clang warning:
> drivers/ide/ide-taskfile.c:229:22: warning: Value stored to 'cursg'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied, thanks Colin.
