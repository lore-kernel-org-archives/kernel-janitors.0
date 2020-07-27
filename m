From: Al Viro <viro@zeniv.linux.org.uk>
Date: Mon, 27 Jul 2020 18:43:15 +0000
Subject: Re: [PATCH][next] binfmt_elf: fix unsigned regset0_size compared to less than zero
Message-Id: <20200727184315.GK794331@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727174054.154765-1-colin.king@canonical.com>
In-Reply-To: <20200727174054.154765-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 27, 2020 at 06:40:54PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable regset0_size is an unsigned int and it is being checked
> for an error by checking if it is less than zero, and hence this
> check is always going to be false.  Fix this by making the variable
> regset0_size signed.

Folded and pushed...
