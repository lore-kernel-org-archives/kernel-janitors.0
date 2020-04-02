From: Christian Brauner <christian.brauner@ubuntu.com>
Date: Thu, 02 Apr 2020 11:12:02 +0000
Subject: Re: [PATCH] binderfs: remove redundant assignment to pointer ctx
Message-Id: <20200402111202.epm46revtpgiodwj@wittgenstein>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402105000.506296-1-colin.king@canonical.com>
In-Reply-To: <20200402105000.506296-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>

On Thu, Apr 02, 2020 at 11:50:00AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer ctx is being initialized with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
