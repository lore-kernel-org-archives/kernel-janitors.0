From: Timur Tabi <timur@kernel.org>
Date: Fri, 20 Dec 2019 14:20:24 +0000
Subject: Re: [PATCH] serial: ucc_uart: remove redundant assignment to pointer bdp
Message-Id: <2714d205-245a-a4e1-8335-53405608a286@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191220001000.39859-1-colin.king@canonical.com>
In-Reply-To: <20191220001000.39859-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/19/19 6:10 PM, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
> 
> The variable bdp is being initialized with a value that is never
> read and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Acked-by: Timur Tabi <timur@kernel.org>

Looks like this bug has been there since day 1.
